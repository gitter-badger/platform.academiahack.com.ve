class DropProductUserTable < ActiveRecord::Migration
  def change
    drop_table :product_users
  end
end
