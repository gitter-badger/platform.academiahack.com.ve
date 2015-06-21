class AddTextsToDay < ActiveRecord::Migration
  def change
    add_column :days, :required_knowledge, :text
    add_column :days, :cheatsheet, :text
  end
end
