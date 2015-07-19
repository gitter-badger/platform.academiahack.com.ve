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
#  git_ssh_url  :string(255)
#  project_id   :string(255)
#

require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
