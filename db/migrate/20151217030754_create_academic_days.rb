class CreateAcademicDays < ActiveRecord::Migration
  def change
    create_table :academic_days do |t|
      t.integer :number
      t.integer :position
      t.integer :status
      t.date :schedule
      t.string :mentor_token
      t.string :mentor_status
      t.references :academic_week, index: true
      t.references :day, index: true
      t.references :mentor, index: true
      t.references :promo, index: true
    end
  end
end
