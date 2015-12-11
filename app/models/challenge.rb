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
#  week_id     :integer
#

class Challenge < ActiveRecord::Base
  belongs_to :day
  belongs_to :category
  belongs_to :week
  has_many :comments
  has_many :deliveries
  
  scope :actived_classroom, -> { where(status: 1, time: 'classroom') }
  
  enum status: { blocked: 0, active: 1, cloned: 2 }

  def deliver_by_user user
    deliveries.where(user: user).take
  end
  
  def deploy
    unless self.cloned?
      self.deliveries.each do |delivery|
        puts delivery.challenge_url_ssh
        if delivery.commit
          ##{File.expand_path('~')}
          if self.day
            day = challenge.day
            week = day.week
          elsif self.week
            day = Day.new
            day.number = 0
            week = challenge.week
          end

          g = Git.clone delivery.challenge_url_ssh, "/home/hack/hackers/w#{week.number}_d#{day.number}_ch#{self.id}/#{delivery.user.gitlab_user}"
          g.checkout delivery.commit
        end
      end
      self.status = "cloned"
      self.save
    end
  end
  
  def self.deploy_challenges
    Challenge.actived_classroom.each do |challenge|
      challenge.deploy
    end
  end
end
