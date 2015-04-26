class ChallengesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    challenge_id = params[:id]
    @challenge = Challenge.find challenge_id

    if current_user.github_user
      @delivery = Delivery.where(challenge_id: challenge_id, user_id: current_user.id).first
      unless @delivery
        @delivery = Delivery.new
        @delivery.user = current_user
        @delivery.challenge = @challenge
      end
    end

    if current_user.email == 'mentores@hack4geeks.co'
      @deliveries = Delivery.where challenge_id: challenge_id
    end
  end

end
