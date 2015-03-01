class AddStatusToWeeks < ActiveRecord::Migration
  def change
    add_column :weeks, :status, :integer
  end
end
