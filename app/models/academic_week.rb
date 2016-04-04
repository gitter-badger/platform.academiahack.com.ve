# == Schema Information
#
# Table name: academic_weeks
#
#  id         :integer          not null, primary key
#  position   :integer
#  promo_id   :integer
#  week_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class AcademicWeek < ActiveRecord::Base
  belongs_to :promo
  belongs_to :week
  has_many :academic_days, dependent: :destroy
  scope :ordered,      -> { order('position ASC') }

  acts_as_list :position

  def self.current_week_number
    black_days = 0
    current_calendar_day = DateTime.now.to_date
    Promo.current.start_date.upto(current_calendar_day) do |date|
      black_days += 1 if day_unavailable?(date)
    end

    diff = (current_calendar_day.to_date - Promo.current.start_date) - black_days + 1
    diff < 0 ? 0 : (diff/5).ceil
  end

  def self.calculate_htd
    #Get current promo
    current_promo = Promo.current
    academic_weeks = AcademicWeek.where promo: current_promo
    AcademicWeek.schedule current_promo.start_date, academic_weeks
  end

  private
  def self.day_unavailable? day
    #Revisar si el dia es sabado o domingo
    if day.saturday? || day.sunday?
      return true
    end
    #Revisar si el dia esta en el blacklist
    black_days = BlackDay.all
    black_days.each do |black_day|
      unless black_day.black_date
        #Armar la fecha si es recurrente con el ano actual
        current_year = Date.today.strftime("%Y")
        black_day.black_date = DateTime.new(current_year, black_day.month, black_day.day)
      end
      if black_day.black_date == day
        return true
      end
    end
    false
  end

  def self.schedule start_date, academic_weeks
    current_calendar_day = start_date
    academic_weeks.each do |academic_week|
      academic_week.academic_days.each do |academic_day|
        while AcademicWeek.day_unavailable?(current_calendar_day)
          current_calendar_day += 1
        end
        academic_day.schedule = current_calendar_day
        academic_day.save
        current_calendar_day += 1
      end
    end
  end

  def self.create_all promo, week, position=nil
    current_promo_day = 1
    academic_week = AcademicWeek.new({position: position, promo_id: promo.id, week_id: week.id})
    academic_week.move_to_bottom unless position
    academic_week.save

    days = Day.where(week: week).order(:number)

    days.each do |day|
      AcademicDay.create({position: day.position, number: ((position-1) * 5) + current_promo_day, day_id: day.id, academic_week_id: academic_week.id, status: 1})
      current_promo_day += 1
    end
  end
end
