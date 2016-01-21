class AddGitlabUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gitlab_user_id, :string
  end
end
