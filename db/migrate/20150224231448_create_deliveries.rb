class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.references :challenge, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
