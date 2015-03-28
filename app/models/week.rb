class Week < ActiveRecord::Base
    has_many :days
    enum status: [ :blocked, :active, :done ]
    acts_as_list
end
