# == Schema Information
#
# Table name: black_days
#
#  id          :integer          not null, primary key
#  day         :integer
#  month       :integer
#  black_date  :date
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class BlackDayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
