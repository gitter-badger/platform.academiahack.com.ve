class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    @user = User.find(params[:id])
  end
end
