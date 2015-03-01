ActiveAdmin.register Category do

  controller do
    def permitted_params
      params.permit category: [ :name, :image]
    end
  end

  form do |f|
    f.inputs "Detalles de la categoria" do
      f.input :name
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

  index do
     column :name
     column :image do |category|
       image_tag(category.image.url(:thumb))
     end
     actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :image do
        image_tag(ad.image.url(:thumb))
      end
    end
  end


end
