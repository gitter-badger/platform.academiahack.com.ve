# == Schema Information
#
# Table name: product_promos
#
#  id         :integer          not null, primary key
#  product_id :integer
#  promo_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProductPromo < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_and_belongs_to_many :promos
end
