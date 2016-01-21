class ChangeValueFromParameters < ActiveRecord::Migration
  def change
    change_column :parameters, :value,  :text
  end
end
