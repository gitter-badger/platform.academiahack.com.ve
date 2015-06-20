# == Schema Information
#
# Table name: deliveries
#
#  id           :integer          not null, primary key
#  challenge_id :integer
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  commit       :string(255)
#  status       :integer
#

require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
