class AddProductToWeeks < ActiveRecord::Migration
  def change
    add_reference :weeks, :product, index: true
  end
end
