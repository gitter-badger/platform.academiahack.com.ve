ActiveAdmin.register Day do
  config.sort_order = 'number_desc'
  controller do
    def permitted_params
      params.permit day: [:number, :name, :image, :status, :week_id]
    end
  end

  form do |f|
    f.inputs "Detalles del día" do
      f.input :number, :input_html => { :value => Day.maximum(:number) + 1}
      f.input :name
      f.input :week, as: :select
      f.input :status, as: :select, collection: Day.statuses.keys, input_html: { class: 'chosen-select' }
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
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
    end
  end

end
