class AddScheduleToDays < ActiveRecord::Migration
  def change
    add_column :days, :schedule, :date
  end
end
