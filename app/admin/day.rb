ActiveAdmin.register Day do

  # Don't forget to add the image attribute (here thumbnails) to permitted_params
  controller do
    def permitted_params
      params.permit day: [:number, :name, :description, :image]
    end
  end

  form do |f|
    f.inputs "Detalles del día" do
      f.input :number
      f.input :name
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
      # Will preview the image when the object is edited
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :number
      row :name
      row :description
      row :image do
        image_tag(ad.image.url(:thumb))
      end
      # Will display the image on show object page
    end
  end

  # form do |f|
  #   f.inputs "Edit My Model" do
  #     f.input :status, as: :select, collection: Day.status.keys
  #   end
  #   f.actions
  # end

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


end
