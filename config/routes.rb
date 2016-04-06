Rails.application.routes.draw do
  root 'weeks#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :users, only: [:show]
  resources :projects
  resources :academic_days

  get 'activities/error' => 'activities#error', as: :activities_error
  get 'deliveries/:id/review/:status' => 'deliveries#review', as: :delivery_review
  get 'challenges/:id/deploy' => 'challenges#deploy', as: :challenge_deploy

  get 'weeks/:id/challenges/new' => 'challenges#create_week', as: :new_week_challenge

  put 'academic_days/:id/toggle' => 'academic_days#toggle', as: :academic_days_toggle
  put 'academic_weeks/:id/open' => 'academic_days#open_academic_week', as: :week_open
  put 'academic_weeks/:id/close' => 'academic_days#close_academic_week', as: :week_close
  put 'academic_day/:academic_day_id/mentor/:mentor_id' => 'academic_days#assign_mentor', as: :assign_mentor
  get 'mentor/confirm/:token' => 'academic_days#confirm_mentor', as: :confirm_mentor


  resources :promos do
    get '/manage' => 'promos#manage'
    post '/calculate' => 'promos#calculate'
    resources :academic_weeks
  end
  # get 'promo/:id/manage' => 'promos#manage', as: :manage_promo
  # get 'academic_week/new/:promo_id' => 'academic_weeks#new', as: :academic_week_new
  #
  # post 'academic_weeks' => 'academic_weeks#create', as: :academic_weeks
  # delete 'academic_weeks/:id' => 'academic_weeks#destroy', as: :academic_weeks

  resources :weeks, shallow: true do
    resources :days, shallow: true do
      resources :videos
      resources :challenges
    end
  end

  resources :deliveries

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
