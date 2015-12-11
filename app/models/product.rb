# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  duration    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  has_many :enrollments
end
