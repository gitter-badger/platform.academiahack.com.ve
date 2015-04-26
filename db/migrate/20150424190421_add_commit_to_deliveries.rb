class AddCommitToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :commit, :string
  end
end
