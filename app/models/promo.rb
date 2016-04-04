# == Schema Information
#
# Table name: promos
#
#  id         :integer          not null, primary key
#  number     :integer
#  name       :string(255)
#  start_date :date
#  created_at :datetime
#  updated_at :datetime
#  git_url    :string(255)
#  git_group  :string(255)
#

class Promo < ActiveRecord::Base
  has_many :enrollments
  has_many :academic_weeks

  def self.current
    Promo.find_by(number: Parameter.find_by(key:"current_promo").value)
  end

end
