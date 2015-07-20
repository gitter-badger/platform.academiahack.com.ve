# == Schema Information
#
# Table name: parameters
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Parameter < ActiveRecord::Base
end
