ActiveAdmin.register Enrollment do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :product_id, :promo_id, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :product
    column :promo
    column 'User' do |enrollment|
      link_to "#{enrollment.user.name} #{enrollment.user.last_name}", admin_user_path(enrollment.user)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :product, :input_html => { :class => "chosen-input" }
      f.input :promo, :input_html => { :class => "chosen-input" }
      f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map{|u| ["#{u.name} #{u.last_name}", u.id]}, :input_html => { :class => "chosen-input" }
    end
    f.actions
  end


end
