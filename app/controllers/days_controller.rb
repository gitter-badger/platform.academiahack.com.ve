class DaysController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

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
