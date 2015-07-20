class ChangeGithubUserToGitlabUser < ActiveRecord::Migration
  def change
    rename_column :users, :github_user, :gitlab_user
  end
end
