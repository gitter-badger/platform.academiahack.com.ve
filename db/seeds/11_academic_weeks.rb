weeks = Week.all
current_promo = Promo.current

def create_academic_week_schedule promo, week, position=nil
  current_promo_day = 1
  academic_week_schedule = AcademicWeekSchedule.create({position: position, promo_id: promo.id, week_id: week.id})
  days = Day.where(week: week).order(:number)

  days.each do |day|
    AcademicDaySchedule.create({number: ((position-1) * 5) + current_promo_day, day_id: day.id, academic_week_schedule_id: academic_week_schedule.id, status: 1})
    current_promo_day += 1
  end
end

weeks.each_with_index do |week, index|
  create_academic_week_schedule current_promo, week, index+1
end

AcademicWeekSchedule.calculate_htd