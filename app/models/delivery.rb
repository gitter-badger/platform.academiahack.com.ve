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
#

class Delivery < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user

  def challenge_repo
    user = self.user
    challenge = self.challenge
    day = challenge.day
    week = day.week

    "w_#{week.number}_d_#{day.number}_ch#{challenge.id}_#{user.github_user}"
  end

  def challenge_url
    challenge_url = ''
    param_github_url = Parameter.find_by_key 'github_promo_url'

    if param_github_url
      challenge_url = param_github_url.value + challenge_repo
    end
    challenge_url
  end

  def commit_url
    challenge_url + "/commit/#{self.commit}"
  end
end
