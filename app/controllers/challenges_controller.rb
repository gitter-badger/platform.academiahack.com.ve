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

  def create_project
    @challenge = Challenge.find params[:id]
    project = @challenge.create_project current_user
    if project && project.to_hash && (git_ssh_url = project.to_hash['ssh_url_to_repo']) && git_ssh_url
      @delivery = Delivery.new
      @delivery.user = current_user
      @delivery.challenge = @challenge
      @delivery.git_ssh_url = git_ssh_url
      @delivery.save
      redirect_to challenge_path(@challenge), notice: 'Repositorio creado'
    else
      redirect_to challenge_path(@challenge), notice: 'Error al crear el repositorio!'
    end
  end

end
