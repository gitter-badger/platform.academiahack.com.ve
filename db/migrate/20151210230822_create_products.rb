class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.integer :duration
      t.references :promo, index: true

      t.timestamps
    end
  end
end
