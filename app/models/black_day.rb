# == Schema Information
#
# Table name: black_days
#
#  id          :integer          not null, primary key
#  day         :integer
#  month       :integer
#  black_date  :date
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class BlackDay < ActiveRecord::Base
  def self.from_date date
    self.where("black_date > ?", date).order(:black_date)
  end

  def self.range_date start_date, finish_date
    self.where("black_date > ? && black_date < ?", start_date, finish_date).order(:black_date)
  end

  def self.order_constructed black_days
    ordered = []
    black_days.each do |black_day|
      unless black_day.black_date
        black_day.construct_date
      end
      ordered.push black_day
    end
    ordered.sort_by(&:black_date)
  end

  def construct_date
    current_year = Date.today.strftime("%Y").to_i
    self.black_date = DateTime.new(current_year, self.month, self.day)
  end
end
