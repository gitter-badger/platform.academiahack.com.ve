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

require 'test_helper'

class MentorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
