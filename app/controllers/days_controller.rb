class DaysController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    @day = Day.includes(challenges: [:category]).find(params[:id])
    @days = @day.order_list
    @video = Video.new

    @post = {title: 'Esto es una prueba', body: 'Este es el contenido de la prueba', published: true}

    unless @days
      redirect_to root_path, notice: 'El dia no se encuentra o esta bloqueado'
    end
  end

  def update
    message = 'Dia actualizado correctamente'
    @day = Day.find params[:id]
    unless @day.update(day_params)
      message = 'No se pudo actualizar el dia!'
    end
    redirect_to day_path, notice: message
  end

  private
  def day_params
    params.permit(:required_knowledge, :cheatsheet)
  end


end
