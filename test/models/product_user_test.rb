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

require 'test_helper'

class ProductUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
