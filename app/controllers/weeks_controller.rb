class WeeksController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def index
    @academic_week_schedules = AcademicWeekSchedule.order(:position).where(promo: Promo.current)
    @mentors = Mentor.all.order :type_of

    if params[:current_week]
      @current_week_index = params[:current_week].to_i - 1
    else
      @current_week_index = AcademicWeekSchedule.current_week_number == 0 ? 0 : AcademicWeekSchedule.current_week_number - 1
    end
  end
end
