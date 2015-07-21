# == Schema Information
#
# Table name: videos
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  url                :string(255)
#  day_id             :integer
#  created_at         :datetime
#  updated_at         :datetime
#  video_file_name    :string(255)
#  video_content_type :string(255)
#  video_file_size    :integer
#  video_updated_at   :datetime
#

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
