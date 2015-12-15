class AddGitGroupToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :git_group, :string
  end
end
