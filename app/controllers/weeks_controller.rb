class WeeksController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'
  

  def index
    @academic_weeks = AcademicWeek.order(:position).where(promo: Promo.current)
    @mentors = Mentor.order :type_of
    @mentors_typed = @mentors.group_by { |mentor| mentor.type_of }

    if params[:current_week]
      @current_week_index = params[:current_week].to_i - 1
    else
      @current_week_index = AcademicWeek.current_week_number == 0 ? 0 : AcademicWeek.current_week_number - 1
    end
  end
end
