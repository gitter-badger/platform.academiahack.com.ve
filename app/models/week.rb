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
    belongs_to :product
    has_many :days, -> { order(:number) }
    has_one :challenge
    enum status: [ :blocked, :active, :done ]
    acts_as_list
end

