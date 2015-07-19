class AddNameSpaceIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name_space_id, :string
  end
end
