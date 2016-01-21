class ChallengesController < ApplicationController
  before_action :authenticate_user!
  layout 'activities'

  def new
    @challenge = Challenge.new
    @day = Day.find params[:day_id]

    # Esta info es opcional y solo se utiliza para pintar el cronograma academico si este dia tiene relacion a un dia
    # academico y esta en la promo actual
    @academic_day = AcademicDaySchedule.get_academic_day @day
    @academic_days = @academic_day.order_list
  end

  def edit
    @challenge = Challenge.find params[:id]

    # Esta info es opcional y solo se utiliza para pintar el cronograma academico si este reto tiene un dia relacionado
    # a un dia academico y esta en la promo actual
    @academic_day = AcademicDaySchedule.get_academic_day @challenge.day
    @academic_days = @academic_day.order_list
  end

  def update
    challenge = Challenge.find params[:id]
    if challenge.update(challenges_params)
      message = "Reto actualizado exitosamente"
    else
      message = "Error al actualizar el reto"
    end

    #Si existe un dia academico para el reto ir a el
    @academic_day = AcademicDaySchedule.get_academic_day challenge.day
    if @academic_day
      redirect_to academic_day_path(@academic_day, tab: "challenge"), notice: message
    else
      redirect_to weeks_path, notice: message
    end
  end

  def create
    challenge = Challenge.new(challenges_params)
    day = Day.find params[:day_id]

    challenge.day = day
    challenge.time = "classroom"
    challenge.status ="active"
    if challenge.save
      message = "Reto creado exitosamente"
    else
      message = "Error al crear el reto"
    end

    #Si existe un dia academico para el reto ir a el
    @academic_day = AcademicDaySchedule.get_academic_day day
    if @academic_day
      redirect_to academic_day_path(@academic_day, tab: "challenge"), notice: message
    else
      redirect_to weeks_path, notice: message
    end
  end

  def destroy
    challenge = Challenge.find params[:id]
    if challenge.destroy
      message = "Reto eliminado exitosamente"
    else
      message = "Error al eliminar el reto"
    end

    #Si existe un dia academico para el reto ir a el
    @academic_day = AcademicDaySchedule.get_academic_day challenge.day
    if @academic_day
      redirect_to academic_day_path(@academic_day, tab: "challenge"), notice: message
    else
      redirect_to weeks_path, notice: message
    end
  end

  def show
    @challenge = Challenge.find params[:id]
    @promo_group = Parameter.find_by_key 'promo_group'
    gitlab_user = current_user.get_gitlab_user

    if gitlab_user && gitlab_user.length > 0 && !current_user.gitlab_user_id
      current_user.gitlab_user_id = gitlab_user[0].id
      current_user.save
    end

    if current_user.gitlab_user_id || current_user.mentor
      @delivery = @challenge.deliver_by_user current_user

      if current_user.mentor
        @deliveries = Delivery.where challenge_id: params[:id]
      end
    else
      redirect_to weeks_path, notice: "Cuenta en gitlab no existente (revisa si el API esta funcional), debes crearla con el username: '#{current_user.gitlab_user}'"
    end
    # @delivery = Delivery.where(challenge_id: params[:id], user_id: current_user.id).first

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
