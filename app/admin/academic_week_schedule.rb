ActiveAdmin.register AcademicWeek do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :position, :promo_id, :week_id
config.sort_order = 'position_asc'
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  index do
    column :position
    column :promo
    column :week
    actions
  end

end
