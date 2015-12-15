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

  def self.calculate_htd_schedule
    #Get current promo
    current_promo = Promo.find_by(number: Parameter.find_by(key:"current_promo").value)
    prope_htd = Product.find_by code:"002"
    htd = Product.find_by code:"001"

    weeks_prope = Week.where product: prope_htd
    weeks_htd = Week.where product: htd

    current_calendar_day = current_promo.start_date
    current_calendar_day = Promo.schedule_weeks current_calendar_day, weeks_prope
    current_calendar_day = Promo.schedule_weeks current_calendar_day, weeks_htd
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

  def self.schedule_weeks start_date, weeks
    current_calendar_day = start_date
    weeks.each do |week|
      week.days.each do |day|
        while Promo.day_unavailable?(current_calendar_day)
          current_calendar_day += 1
        end
        day.schedule = current_calendar_day
        day.save
        current_calendar_day += 1
      end
    end
    current_calendar_day
  end
end
