class AddStatusToDays < ActiveRecord::Migration
  def change
    add_column :days, :status, :integer
  end
end
