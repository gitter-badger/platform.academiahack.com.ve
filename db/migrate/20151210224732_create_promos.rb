class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.integer :number
      t.string :name
      t.date :start_date

      t.timestamps
    end
  end
end
