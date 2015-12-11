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
#

class Promo < ActiveRecord::Base
  has_many :enrollments
end
