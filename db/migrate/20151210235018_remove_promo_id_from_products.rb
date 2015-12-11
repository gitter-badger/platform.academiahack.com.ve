class RemovePromoIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :promo_id
  end
end
