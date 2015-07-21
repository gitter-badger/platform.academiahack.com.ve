# == Schema Information
#
# Table name: challenges
#
#  id          :integer          not null, primary key
#  time        :string(255)
#  title       :string(255)
#  description :text
#  day_id      :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  status      :integer
#

require 'test_helper'

class ChallengeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
