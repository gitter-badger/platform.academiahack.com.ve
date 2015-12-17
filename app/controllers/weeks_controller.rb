class WeeksController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def index
    @academic_week_schedules = AcademicWeekSchedule.order(:position).where(promo: Promo.current)
    @current_week_index = AcademicWeekSchedule.current_week_number == 0 ? 0 : AcademicWeekSchedule.current_week_number - 1
  end
end
