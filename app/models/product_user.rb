# == Schema Information
#
# Table name: product_users
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProductUser < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :users
end
