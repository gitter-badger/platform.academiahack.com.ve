class Day < ActiveRecord::Base
  belongs_to :week
  enum status: [ :blocked, :active, :done ]
end
