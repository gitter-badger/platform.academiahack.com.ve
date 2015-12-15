class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def error
    Promo.calculate_htd_schedule
  end
end
