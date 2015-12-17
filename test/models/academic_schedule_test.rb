# == Schema Information
#
# Table name: academic_schedules
#
#  id         :integer          not null, primary key
#  schedule   :date
#  position   :integer
#  promo_id   :integer
#  week_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AcademicScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
