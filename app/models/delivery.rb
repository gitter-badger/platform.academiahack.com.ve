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

  def challenge_repo
    user = self.user
    challenge = self.challenge
    day = challenge.day
    week = day.week

    "w#{week.number}_d#{day.number}_ch#{challenge.id}_#{user.gitlab_user}"
  end

  def challenge_url
    "http://gitlab.com/#{self.user.gitlab_group}/#{challenge_repo}"
  end
  
  def commits
    Gitlab.commits(self.project_id)
  end

  def commit_url(user)
     "#{challenge_url(user)}/commit/#{self.commit}"
  end
end
