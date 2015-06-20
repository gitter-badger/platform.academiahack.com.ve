class ChallengesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    @challenge = Challenge.find params[:id]
    @promo_group = Parameter.find_by_key 'promo_group'

    # @delivery = Delivery.where(challenge_id: params[:id], user_id: current_user.id).first
    @delivery = @challenge.deliver_by_user current_user
    unless @delivery
      @delivery = Delivery.new
      @delivery.user = current_user
      @delivery.challenge = @challenge
    end

    if current_user.email == 'mentores@hack4geeks.co'
      @deliveries = Delivery.where challenge_id: params[:id]
    end
  end

end
