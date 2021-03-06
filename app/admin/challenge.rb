ActiveAdmin.register Challenge do

  controller do
    def permitted_params
      params.permit challenge: [:time, :title, :description, :day_id, :category_id, :status]
    end

    def create
      challenge = Challenge.new(challenge_params)
      message = ''

      if challenge.save
        telegram_hack = TelegramHack.get_instance
        Thread.new do
          telegram_hack.challenge_published! challenge.day.name
        end
      else
        message = 'No se pudo cargar el reto'
      end
      redirect_to challenge_path(challenge), notice: message
    end

    def update
      challenge = Challenge.find params[:id]
      message = ''

      unless challenge.update(challenge_params)
        message = 'No se pudo actualizar el reto!'
      end
      redirect_to challenge_path(challenge), notice: message
    end

    private
    def challenge_params
      params.require(:challenge).permit(:time, :title, :description, :day_id, :week_id, :category_id, :status)
    end
  end

  form do |f|
    f.inputs "Detalles del reto" do
      f.input :day
      f.input :week
      f.input :category
      f.input :title
      f.input :time, as: :select, collection: {classroom:'classroom', homework:'homework'}
      f.input :status, as: :select, collection: {active:'active', blocked:'blocked'}
      f.input :description, as: :text
    end
    f.actions
  end

  # index do
  #    column :title
  #    column :time
  #    column :day
  #    column :category
  #    actions
  # end
  #
  # show do |ad|
  #   attributes_table do
  #     row :title
  #     row :time
  #     row :description
  #   end
  # end

end
