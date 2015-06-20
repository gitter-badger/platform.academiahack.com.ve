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
#

class Week < ActiveRecord::Base
    has_many :days, -> { order(:number) }
    enum status: [ :blocked, :active, :done ]
    acts_as_list
end
