class Operation < ActiveRecord::Base
  belongs_to :user
  enum type_of: [ :support, :leader]
end
