class CreateAcademicWeeks < ActiveRecord::Migration
  def change
    create_table :academic_weeks do |t|
      t.integer :position
      t.references :promo, index: true
      t.references :week, index: true

      t.timestamps
    end
  end
end
