class DaysController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    @day = Day.includes(challenges: [:category]).find(params[:id])
    @days = @day.order_list

    if params[:video_id]
      @video = Video.find params[:video_id]
    else
      @video = Video.new
    end

    @tab = params[:tab] ? params[:tab] : "requirements"

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

    academic_day_id = session.delete(:academic_day_id)
    redirect_to academic_day_path(id: academic_day_id), notice: message
  end

  private
  def day_params
    params.permit(:required_knowledge, :cheatsheet)
  end


end
