class AddGitSshUrlToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :git_ssh_url, :string
  end
end
