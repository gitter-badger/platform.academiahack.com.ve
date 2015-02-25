class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  
  def week
    @weeks = Week.all
  end

  def day
  end

  def challenge
  end
end
