# == Schema Information
#
# Table name: academic_day_schedules
#
#  id                        :integer          not null, primary key
#  number                    :integer
#  schedule                  :date
#  academic_week_schedule_id :integer
#  day_id                    :integer
#  status                    :integer
#

class AcademicDaySchedule < ActiveRecord::Base
  belongs_to :academic_week_schedule
  belongs_to :day
  belongs_to :mentor

  enum status: [ :blocked, :active, :done ]

  def self.get_academic_day day, promo=nil
    promo = promo ? promo : Promo.current
    self.promo_academic_days(promo).where(day_id: day.id).take
  end

  def self.promo_academic_days promo=nil
    promo = promo ? promo : Promo.current
    AcademicDaySchedule.joins(:academic_week_schedule).where('academic_week_schedules.promo_id' => promo)
  end

  def order_list promo=nil
    promo = promo ? promo : Promo.current

    academic_days = AcademicDaySchedule.promo_academic_days promo
    count = academic_days.count

    if self.active?
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
    end
    academic_days
  end

  def complete(academic_day_number, repeat = 0, position = 'none', promo=nil)
    day_min = academic_day_number - 2
    day_max = academic_day_number + 2

    academic_days = AcademicDaySchedule.joins(:academic_week_schedule).where('academic_week_schedules.promo_id' => promo).where('number >= ? AND number <= ?', day_min, day_max).order(:number)
    add(academic_days, repeat, position)
  end

  def add(academic_days, repeat, position)
    repeat.times do
      aux_academic_day = AcademicDaySchedule.new
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
end
