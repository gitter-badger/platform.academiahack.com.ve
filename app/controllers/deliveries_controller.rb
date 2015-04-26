class DeliveriesController < ApplicationController
  def create
    @delivery = Delivery.new(delivery_params)
    message = ''
    unless @delivery.save
      message = 'No se pudo realizar la entrega! Comunicate con el mentor que asigno el reto'
    end
    redirect_to :back, notice: message
  end

  def update
    message = ''
    @delivery = Delivery.find params[:id]

    unless @delivery.update(delivery_params)
      message = 'No se pudo actualizar la entrega! Comunicate con el mentor que asigno el reto'
    end
    redirect_to :back, notice: message
  end


  def review
    message = 'Reto revisado'
    if admin_user_signed_in?
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
      redirect_to destroy_user_session_path, notice: 'El usuario actual no es admin'
    end
  end

  private
  def delivery_params
    params.require(:delivery).permit(:commit, :user_id, :challenge_id)
  end
end
