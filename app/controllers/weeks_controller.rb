class WeeksController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def index
    #@weeks = Week.order(:position).includes(:days).all
    @academic_week_schedules = AcademicWeekSchedule.order(:position).where(promo: Promo.current)

    #parameter = Parameter.find_by_key :current_week
    #if parameter
    #  @current_week_index = parameter.value.to_i - 1
    #else
    #  @current_week_index = 0
    #end

    @current_week_index = AcademicWeekSchedule.current_week_number == 0 ? 0 : AcademicWeekSchedule.current_week_number - 1
  end
end
