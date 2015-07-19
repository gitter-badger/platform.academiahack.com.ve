# == Schema Information
#
# Table name: challenges
#
#  id          :integer          not null, primary key
#  time        :string(255)
#  title       :string(255)
#  description :text
#  day_id      :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  status      :integer
#

class Challenge < ActiveRecord::Base
  belongs_to :day
  belongs_to :category
  has_many :comments
  has_many :deliveries

  def deliver_by_user user
    deliveries.where(user: user).take
  end
  
  def deploy
    self.deliveries.each do |delivery|
      puts delivery.challenge_url_ssh
      Git.clone delivery.challenge_url_ssh, "#{File.expand_path('~')}/temp/w_#{self.day.week.number}_d_#{self.day.number}_ch#{self.id}/#{delivery.user.gitlab_user}"
      #TODO cambiar commit.
    end
  end
end
