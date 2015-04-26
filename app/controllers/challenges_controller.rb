class ChallengesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    challenge_id = params[:id]
    @challenge = Challenge.find challenge_id
    @promo_group = Parameter.find_by_key 'promo_group'

    @delivery = Delivery.where(challenge_id: challenge_id, user_id: current_user.id).first
    unless @delivery
      @delivery = Delivery.new
      @delivery.user = current_user
      @delivery.challenge = @challenge
    end

    if current_user.email == 'mentores@hack4geeks.co'
      @deliveries = Delivery.where challenge_id: challenge_id
    end
  end

end
