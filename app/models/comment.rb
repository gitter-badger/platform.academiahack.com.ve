class Comment < ActiveRecord::Base
  belongs_to :challege
  belongs_to :comment
  belongs_to :user
end
