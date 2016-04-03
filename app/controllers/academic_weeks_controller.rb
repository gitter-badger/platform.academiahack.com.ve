class AcademicWeeksController < ApplicationController
  def new
    @promo = Promo.find params[:promo_id]
  end
end
