class AddGithubToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_user, :string
  end
end
