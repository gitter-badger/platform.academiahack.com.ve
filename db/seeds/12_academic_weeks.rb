weeks = Week.all
promo4 = Promo.find_by number: 4
promo5 = Promo.find_by number: 5

# def create_academic_week promo, week, position=nil
#   current_promo_day = 1
#   academic_week = AcademicWeek.create({position: position, promo_id: promo.id, week_id: week.id})
#   days = Day.where(week: week).order(:number)
#
#   days.each do |day|
#     AcademicDay.create({number: ((position-1) * 5) + current_promo_day, day_id: day.id, academic_week_id: academic_week.id, status: 1})
#     current_promo_day += 1
#   end
# end

weeks.each_with_index do |week, index|
  AcademicWeek.create_all promo4, week, index+1
end

AcademicWeek.calculate_htd promo4