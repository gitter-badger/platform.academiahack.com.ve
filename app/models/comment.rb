# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  text        :string(255)
#  challege_id :integer
#  comment_id  :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :challege
  belongs_to :comment
  belongs_to :user
  has_one :comment
end
