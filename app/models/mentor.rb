# == Schema Information
#
# Table name: mentors
#
#  id         :integer          not null, primary key
#  type_of    :integer
#  identity   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Mentor < ActiveRecord::Base
  belongs_to :user
  has_many :academic_day_schedules
  enum type_of: [ :regular, :freelancer, :student_teaching, :leader]
end
