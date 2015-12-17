ActiveAdmin.register AcademicDaySchedule do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :position, :schedule, :day_id

config.sort_order = 'schedule_asc'
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  index do
    column 'Promo' do |academic_day_schedule|
      link_to "#{academic_day_schedule.academic_week_schedule.promo.name}", admin_user_path(academic_day_schedule.academic_week_schedule.promo)
    end
    column 'Week' do |academic_day_schedule|
      link_to "#{academic_day_schedule.academic_week_schedule.week.name}", admin_user_path(academic_day_schedule.academic_week_schedule.week)
    end
    column :day
    column :schedule
    actions
  end

end
