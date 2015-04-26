ActiveAdmin.register Challenge do

  controller do
    def permitted_params
      params.permit challenge: [:time, :title, :description, :day_id, :category_id, :status]
    end
  end

  form do |f|
    f.inputs "Detalles del reto" do
      f.input :day
      f.input :category
      f.input :title
      f.input :time, as: :select, collection: {classroom:'classroom', homework:'homework'}
      f.input :status, as: :select, collection: {active:1, blocked:0}
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
