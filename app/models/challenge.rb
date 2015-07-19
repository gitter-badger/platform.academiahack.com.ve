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

  def repo_name user
    day = self.day
    week = day.week

    "w_#{week.number}_d_#{day.number}_ch#{self.id}_#{user.gitlab_user}"
  end

  def deliver_by_user user
    deliveries.where(user: user).take
  end

  def create_project user
    Gitlab.create_project(repo_name(user), {:description => self.description, :namespace_id => user.name_space_id})
  end
  
  def deploy
    deliveries.each do |delivery|
      puts File.expand_path('~')
      #Git.clone delivery.challenge_url_ssh, "~/temp/w_#{@day.week.number}_d_#{@day.number}_ch#{self.id}/#{delivery.user.gitlab_user}"
    end
  end
end
