class AcademicWeeksController < ApplicationController
  def new
    @promo = Promo.find params[:promo_id]
    @weeks = Week.all
    @academic_week = AcademicWeek.new
  end

  def create
    promo = Promo.find params[:promo_id]
    week = Week.find params[:academic_week][:week_id]
    AcademicWeek.create_all promo, week
    redirect_to promo_manage_path(promo_id: promo)
  end

  def destroy
    promo = Promo.find params[:promo_id]
    academic_week = AcademicWeek.find params[:id]
    if academic_week.destroy
      message = 'OK'
    else
      message = 'ERROR!'
    end
    redirect_to promo_manage_path(promo_id: promo), alert: message
  end
end
