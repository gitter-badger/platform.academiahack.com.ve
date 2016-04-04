class PromosController < ApplicationController
  def manage
    @promo = Promo.find params[:promo_id]
    @black_days = BlackDay.from_date(@promo.start_date).order(:black_date).group_by { |black_day| black_day.name }
  end
end
