class AddProjectIdToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :project_id, :string
  end
end
