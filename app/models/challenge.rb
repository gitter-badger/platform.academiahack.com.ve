class Challenge < ActiveRecord::Base
  belongs_to :day
  belongs_to :category
end
