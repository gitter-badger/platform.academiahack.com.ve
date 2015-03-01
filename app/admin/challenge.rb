ActiveAdmin.register Challenge do

  controller do
    def permitted_params
      params.permit challenge: [:time, :title, :description, :day_id, :category_id]
    end
  end

  # form do |f|
  #   f.inputs "Detalles del día" do
  #     f.input :title
  #     f.input :time, as: :select, collection: {day:'mañana', afternoon:'tarde'}
  #     f.input :description
  #   end
  #   f.actions
  # end

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
