class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.integer :type_of
      t.references :user, index: true

      t.timestamps
    end
  end
end
