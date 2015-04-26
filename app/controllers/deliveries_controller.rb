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

  private
  def delivery_params
    params.require(:delivery).permit(:commit, :user_id, :challenge_id)
  end
end
