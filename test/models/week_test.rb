# == Schema Information
#
# Table name: weeks
#
#  id         :integer          not null, primary key
#  number     :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  status     :integer
#  position   :integer
#  product_id :integer
#

require 'test_helper'

class WeekTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
