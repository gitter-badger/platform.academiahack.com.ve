class CreateBlackDays < ActiveRecord::Migration
  def change
    create_table :black_days do |t|
      t.integer :day
      t.integer :month
      t.date :black_date
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
