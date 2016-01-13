class ProjectsController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def index

  end
end
