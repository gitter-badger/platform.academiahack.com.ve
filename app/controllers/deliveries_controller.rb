class DeliveriesController < ApplicationController
  def create
    @challenge = Challenge.find params[:challenge_id]
    @delivery = Delivery.new @challenge
    @delivery.user = current_user
    
    project = @delivery.create_project
    if project && (project = project.to_hash) && (git_ssh_url = project['ssh_url_to_repo']) && git_ssh_url
      @delivery.project_id = project['id']
      @delivery.git_ssh_url = git_ssh_url
      @delivery.save
      redirect_to challenge_path(@challenge), notice: 'Repositorio creado'
    else
      redirect_to challenge_path(@challenge), notice: 'Error al crear el repositorio!'
    end
  end

  def update
    message = 'Entrega actualizada correctamente'
    @delivery = Delivery.find params[:id]

    if @delivery.update(delivery_params)
      DeliveryMailer.notify_commit_selected(current_user, @delivery).deliver!
    else
      message = 'No se pudo actualizar la entrega! Comunicate con el mentor que asigno el reto'
    end
    redirect_to :back, notice: message
  end


  def review
    message = 'La revision del reto fue cargada correctamente'
    if admin_user_signed_in?
      if user_signed_in?
        if current_user.email.mentor
          delivery = Delivery.find params[:id]
          delivery.status = params[:status]
          unless delivery.save
            message = 'Error al aceptar el reto'
          end
          redirect_to challenge_path(delivery.challenge), notice: message
        else
          redirect_to destroy_user_session_path, notice: 'El usuario actual no es mentor'
        end
      else
        redirect_to new_user_session_path, notice: 'Debe iniciar sesion como mentor'
      end
    else
      redirect_to new_admin_user_session_path, notice: 'El usuario actual no es admin'
    end
  end

  private
  def delivery_params
    params.permit(:commit, :user_id, :challenge_id)
  end
end
