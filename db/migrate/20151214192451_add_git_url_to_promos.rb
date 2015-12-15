class AddGitUrlToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :git_url, :string
  end
end
