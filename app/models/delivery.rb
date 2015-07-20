# == Schema Information
#
# Table name: deliveries
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  commit       :string(255)
#  status       :integer
#  git_ssh_url  :string(255)
#  project_id   :string(255)
#

class Delivery < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user
  
  def initialize(challenge, args={})
    super args
    self.challenge = challenge
  end

  def repo_name
    challenge = self.challenge
    day = challenge.day
    
    week = day.week

    "w#{week.number}_d#{day.number}_ch#{challenge.id}_#{self.user.gitlab_user}"
  end
  
  def create_project
    Gitlab.create_project(repo_name, {:description => self.challenge.description, :namespace_id => self.user.name_space_id})
  end

  def challenge_url
    "http://gitlab.com/#{self.user.gitlab_group}/#{repo_name}"
  end
  
   def challenge_url_ssh
    "git@gitlab.com:#{self.user.gitlab_group}/#{repo_name}.git"
  end
  
  def commits
    Gitlab.commits(self.project_id)
  end

  def commit_url
     "#{challenge_url}/commit/#{self.commit}"
  end
end
