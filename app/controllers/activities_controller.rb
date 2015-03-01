class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  layout "activities"

  def week
    @weeks = Week.all
  end

  def day
    @day = Day.find params[:id]
  end

  def challenge
  end
end
