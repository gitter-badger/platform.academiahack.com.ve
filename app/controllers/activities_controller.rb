class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def error

  end
end
