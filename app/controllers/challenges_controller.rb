class ChallengesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def show
    @challenge_repo = nil
    @challenge_url = nil
    @challenge = Challenge.find params[:id]
    day = @challenge.day
    week = day.week
    challenge = params[:id]

    if current_user.github_user
      @challenge_repo = "w_#{week.number}_d_#{day.number}_ch#{challenge}_#{current_user.github_user}"
      @challenge_url = "https://github.com/Academia-Hack-Promo2/#{@challenge_repo}"
    end
  end
end
