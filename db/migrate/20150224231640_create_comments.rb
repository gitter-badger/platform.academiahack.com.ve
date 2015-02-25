class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :challege, index: true
      t.references :comment, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
