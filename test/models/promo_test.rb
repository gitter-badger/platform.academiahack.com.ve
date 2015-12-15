# == Schema Information
#
# Table name: promos
#
#  id         :integer          not null, primary key
#  number     :integer
#  name       :string(255)
#  start_date :date
#  created_at :datetime
#  updated_at :datetime
#  git_url    :string(255)
#  git_group  :string(255)
#

require 'test_helper'

class PromoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
