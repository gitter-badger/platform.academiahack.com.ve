class AddProductToDays < ActiveRecord::Migration
  def change
    add_reference :days, :product, index: true
  end
end
