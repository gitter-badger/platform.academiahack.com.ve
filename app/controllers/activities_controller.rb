class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  layout "activities"
  
  def week
    @weeks = Week.all
  end

  def day
  end

  def challenge
  end
end
