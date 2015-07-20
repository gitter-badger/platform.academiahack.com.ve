class WeeksController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def index
    @weeks = Week.order(:position).includes(:days).all
    parameter = Parameter.find_by_key :current_week
    if parameter
      @current_week_index = parameter.value.to_i - 1
    else
      @current_week_index = 0
    end
  end
end
