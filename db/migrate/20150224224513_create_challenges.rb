class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :time
      t.string :title
      t.string :description
      t.references :day, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
