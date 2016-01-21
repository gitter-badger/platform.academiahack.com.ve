class RemoveGitlabUserFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :gitlab_user, :string
  end
end
