class CreateProductPromos < ActiveRecord::Migration
  def change
    create_table :product_promos do |t|
      t.references :product, index: true
      t.references :promo, index: true

      t.timestamps
    end
  end
end
