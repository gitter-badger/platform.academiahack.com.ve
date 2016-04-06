class PromosController < ApplicationController
  before_action :authenticate_user!

  def manage
    if current_user.mentor && current_user.mentor.leader?
      @promo = Promo.find params[:promo_id]

      if @promo.finish_date
        @black_days = BlackDay.range_date(@promo.start_date, @promo.finish_date).group_by { |black_day| black_day.name }
      else
        @black_days = BlackDay.from_date(@promo.start_date).group_by { |black_day| black_day.name }
      end
    else
      redirect_to root_path, alert: 'Pagina no autorizada para el usuario actual'
    end
  end

  def calculate
    @promo = Promo.find params[:promo_id]
    AcademicWeek.calculate_htd @promo

    redirect_to promo_manage_path(promo_id: @promo), alert: "Promo recalculada!"
  end
end
