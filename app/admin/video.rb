ActiveAdmin.register Video do
  permit_params :name, :url, :day_id, :video

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  filter :name

  controller do
    def permitted_params
      params.permit video: [:name, :url ,:day_id, :video]
    end
  end

  form do |f|
    f.inputs "Detalles del video" do
      f.input :name
      f.input :url, label: 'External URL'
      f.input :day_id, as: :select, collection: Day.all.map {|day| ["#{day.name}",day.id]}, include_blank: false
      f.input :video, :as => :file, :hint => f.template.image_tag(f.object.video.url(:thumb))
    end
    f.actions
  end

  index do
    column :name
    column :url
    column :day_id
    column :video do |video|
      image_tag(video.video.url(:thumb))
    end
    actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :url
      row :day_id
      row :video do
        image_tag(ad.video.url(:thumb))
      end
    end
  end
end
