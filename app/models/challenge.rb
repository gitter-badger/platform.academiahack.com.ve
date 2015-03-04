class Challenge < ActiveRecord::Base
  belongs_to :day
  belongs_to :category
  has_many :comments
end
