class AddUserIdToProductPromos < ActiveRecord::Migration
  def change
    add_reference :product_promos, :user, index: true
  end
end
