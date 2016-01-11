class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :type_of
      t.integer :identity
      t.references :user, index: true

      t.timestamps
    end
  end
end
