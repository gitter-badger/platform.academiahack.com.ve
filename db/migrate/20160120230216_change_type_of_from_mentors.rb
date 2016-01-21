class ChangeTypeOfFromMentors < ActiveRecord::Migration
  def change
    change_column :mentors, :type_of,  :integer
  end
end
