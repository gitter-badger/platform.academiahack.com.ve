# == Schema Information
#
# Table name: days
#
#  id                 :integer          not null, primary key
#  number             :integer
#  name               :string(255)
#  week_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  status             :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  required_knowledge :text
#  cheatsheet         :text
#  product_id         :integer
#  schedule           :date
#  position           :integer
#

require 'test_helper'

class DayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
