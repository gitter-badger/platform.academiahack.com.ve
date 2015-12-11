# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  product_id :integer
#  promo_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Enrollment < ActiveRecord::Base
  belongs_to :product
  belongs_to :promo
  belongs_to :user
end
