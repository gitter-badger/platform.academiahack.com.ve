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

    if challenge.day
      day = challenge.day
      week = day.week
    elsif challenge.week
      day = Day.new
      day.number = 0
      week = challenge.week
    end

    "w#{week.id}_d#{day.id}_ch#{challenge.id}_#{self.user.gitlab_user}"
  end
  
  def create_project
    begin
      Gitlab.create_project(repo_name, {:description => self.challenge.description.truncate(1900), :namespace_id => self.user.name_space_id})
    rescue
      return nil
    end
  end

  def challenge_url
    "http://gitlab.com/#{self.user.gitlab_group}/#{repo_name}"
  end
  
   def challenge_url_ssh
    "git@gitlab.com:#{self.user.gitlab_group}/#{repo_name}.git"
  end
  
  def commits
    begin
      Gitlab.commits(self.project_id)
    rescue Gitlab::Error::Parsing => error
      return nil
    end

  end

  def commit_url
     "#{challenge_url}/commit/#{self.commit}"
  end
end
