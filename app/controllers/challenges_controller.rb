class ChallengesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def new
    @challenge = Challenge.new
    @day = Day.find params[:day_id]
    @days = @day.order_list
  end

  def edit
    @challenge = Challenge.find params[:id]
    @days = @challenge.day.order_list
  end

  def update
    challenge = Challenge.find params[:id]
    if challenge.update(challenges_params)
      message = "Reto actualizado exitosamente"
    else
      message = "Error al actualizar el reto"
    end
    redirect_to day_path(challenge.day, tab: "challenge"), notice: message
  end

  def create
    challenge = Challenge.new(challenges_params)
    day = Day.find params[:day_id]

    challenge.day = day
    if challenge.save
      message = "Reto creado exitosamente"
    else
      message = "Error al crear el reto"
    end

    redirect_to day_path(day, tab: "challenge"), notice:message
  end

  def destroy
    challenge = Challenge.find params[:id]
    if challenge.destroy
      message = "Reto eliminado exitosamente"
    else
      message = "Error al eliminar el reto"
    end

    redirect_to day_path(challenge.day, tab:"challenge"), notice: message
  end

  def show
    @challenge = Challenge.find params[:id]
    @promo_group = Parameter.find_by_key 'promo_group'

    # @delivery = Delivery.where(challenge_id: params[:id], user_id: current_user.id).first
    @delivery = @challenge.deliver_by_user current_user
    
    if current_user.mentor
      @deliveries = Delivery.where challenge_id: params[:id]
    end
  end
  
   def deploy
    @challenge = Challenge.find params[:id]

    @challenge.deploy

    redirect_to 'http://apps.academiahack.com.ve:2000/'
   end

  def challenges_params
    params.require(:challenge).permit(:title, :description, :time, :category_id, :day_id)
  end
end
