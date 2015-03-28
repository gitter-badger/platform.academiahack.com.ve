class AddPositionToWeek < ActiveRecord::Migration
  def change
    add_column :weeks, :position, :integer
  end
end
