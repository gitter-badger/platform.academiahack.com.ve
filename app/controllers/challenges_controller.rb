class ChallengesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    @challenge = Challenge.find params[:id]
    @promo_group = Parameter.find_by_key 'promo_group'

    # @delivery = Delivery.where(challenge_id: params[:id], user_id: current_user.id).first
    @delivery = @challenge.deliver_by_user current_user
    
    if current_user.email == 'mentores@hack4geeks.co'
      @deliveries = Delivery.where challenge_id: params[:id]
    end
  end
  
   def deploy
    @challenge = Challenge.find params[:id]

    @challenge.deploy

    redirect_to 'http://apps.academiahack.com.ve:2000/'
  end
end
