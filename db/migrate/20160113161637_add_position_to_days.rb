class AddPositionToDays < ActiveRecord::Migration
  def change
    add_column :days, :position, :integer
  end
end
