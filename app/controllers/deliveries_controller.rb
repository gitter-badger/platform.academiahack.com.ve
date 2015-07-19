class DeliveriesController < ApplicationController
  def create
    @delivery = Delivery.new(delivery_params)
    message = 'Entrega creada exitosamente'
    unless @delivery.save
      message = 'No se pudo realizar la entrega! Comunicate con el mentor que asigno el reto'
    end
    redirect_to :back, notice: message
  end

  def update
    message = 'Entrega actualizada correctamente'
    @delivery = Delivery.find params[:id]

    unless @delivery.update(delivery_params)
      message = 'No se pudo actualizar la entrega! Comunicate con el mentor que asigno el reto'
    end
    redirect_to :back, notice: message
  end


  def deploy
    delivery = Delivery.find params[:id]

    redirect_to challenge_path(delivery.challenge), notice: 'ando por acá'
  end

  def review
    message = 'La revision del reto fue cargada correctamente'
    if admin_user_signed_in?
      if user_signed_in?
        if current_user.email == 'mentores@hack4geeks.co'
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
