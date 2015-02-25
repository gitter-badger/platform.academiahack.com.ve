class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :number
      t.string :name
      t.references :week, index: true

      t.timestamps
    end
  end
end
