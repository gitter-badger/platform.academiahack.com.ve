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
end
