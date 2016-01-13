ActiveAdmin.register Day do
  config.sort_order = 'number_desc'
  controller do
    def permitted_params
      params.permit day: [:number, :name, :image, :status, :week_id, :required_knowledge, :cheatsheet]
    end

    def update
      day = Day.find params[:id]
      message = ''

      unless day.update(day_params)
        message = 'No se pudo actualizar el día!'
      end
      redirect_to day_path(day), notice: message
    end

    private
    def day_params
      params.require(:day).permit(:number, :name, :image, :status, :week_id, :required_knowledge, :cheatsheet)
    end
  end

  form do |f|
    f.inputs "Detalles del día" do
      f.input :number, :input_html => { :value => params[:id] ? day.number : (Day.maximum(:number) || 0) + 1}
      f.input :name
      f.input :week, as: :select
      f.input :status, as: :select, collection: Day.statuses.keys, input_html: { class: 'chosen-select' }
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
      f.input :required_knowledge
      f.input :cheatsheet
    end
    f.actions
  end

  index do
     column :number
     column :name
     column :status
     column :week
     column :image do |day|
       image_tag(day.image.url(:thumb))
     end
     actions
  end

  show do |ad|
    attributes_table do
      row :number
      row :name
      row :image do
        image_tag(ad.image.url(:thumb))
      end
      row :required_knowledge
      row :cheatsheet
    end
  end

end
