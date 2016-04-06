# == Schema Information
#
# Table name: academic_days
#
#  id                        :integer          not null, primary key
#  number                    :integer
#  schedule                  :date
#  academic_week_id :integer
#  day_id                    :integer
#  status                    :integer
#  mentor_id                 :integer
#  mentor_token              :string(255)
#  mentor_status             :integer
#

class AcademicDay < ActiveRecord::Base
  belongs_to :academic_week
  belongs_to :day
  belongs_to :mentor

  enum status: [ :blocked, :active, :done ]
  enum mentor_status: [ :invited, :confirmed, :in_classroom]

  acts_as_list scope: :promo

  def self.get_academic_day day, promo=nil
    promo = promo ? promo : Promo.current
    self.promo_academic_days(promo).where(day_id: day.id).take
  end

  def self.promo_academic_days promo=nil
    promo = promo ? promo : Promo.current
    AcademicDay.joins(:academic_week).where('academic_weeks.promo_id' => promo)
  end

  def order_list promo=nil
    promo = promo ? promo : Promo.current

    academic_days = AcademicDay.promo_academic_days promo
    count = academic_days.count

    academic_day_number = self.number

    if academic_day_number == 1
      academic_days = complete(academic_day_number, 2, 'top', promo)
    elsif academic_day_number == 2
      academic_days = complete(academic_day_number, 1, 'top', promo)
    elsif academic_day_number == count - 1
      academic_days = complete(academic_day_number, 1, 'bottom', promo)
    elsif academic_day_number == count
      academic_days = complete(academic_day_number, 2, 'bottom', promo)
    else
      academic_days = complete(academic_day_number, 0, 'none', promo)
    end

    academic_days
  end

  def complete(academic_day_number, repeat = 0, position = 'none', promo=nil)
    day_min = academic_day_number - 2
    day_max = academic_day_number + 2

    academic_days = AcademicDay.joins(:academic_week).where('academic_weeks.promo_id' => promo).where('number >= ? AND number <= ?', day_min, day_max).order(:number)
    add(academic_days, repeat, position)
  end

  def add(academic_days, repeat, position)
    repeat.times do
      aux_academic_day = AcademicDay.new
      aux_academic_day.number = -1
      aux_academic_day.status = nil
      aux_academic_day.day = Day.new
      if position == 'top'
        academic_days.unshift aux_academic_day
      elsif position == 'bottom'
        academic_days.push aux_academic_day
      end
    end
    academic_days
  end

  def self.last_promo_position promo
    AcademicDay.where(promo_id: promo).maximum :position
  end
end
