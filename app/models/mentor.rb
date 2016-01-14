# == Schema Information
#
# Table name: mentors
#
#  id         :integer          not null, primary key
#  type_of    :string(255)
#  identity   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Mentor < ActiveRecord::Base
  belongs_to :user
  has_many :academic_day_schedules
end
