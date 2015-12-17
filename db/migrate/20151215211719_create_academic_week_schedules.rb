class CreateAcademicWeekSchedules < ActiveRecord::Migration
  def change
    create_table :academic_week_schedules do |t|
      t.integer :position
      t.references :promo, index: true
      t.references :week, index: true

      t.timestamps
    end
  end
end
