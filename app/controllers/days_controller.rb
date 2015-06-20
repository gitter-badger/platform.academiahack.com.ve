class DaysController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    @day = Day.includes(challenges: [:category]).find(params[:id])
    @days = @day.order_list

    unless @days
      redirect_to root_path, notice: 'El dia no se encuentra o esta bloqueado'
    end
  end


end
