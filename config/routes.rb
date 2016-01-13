Rails.application.routes.draw do
  root 'weeks#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :users, only: [:show]

  get 'activities/error' => 'activities#error', as: :activities_error
  get 'deliveries/:id/review/:status' => 'deliveries#review', as: :delivery_review
  get 'challenges/:id/deploy' => 'challenges#deploy', as: :challenge_deploy

  put 'days/:id/toggle' => 'days#toggle', as: :day_toggle
  put 'weeks/:id/open' => 'weeks#open', as: :week_open
  put 'weeks/:id/close' => 'weeks#close', as: :week_close

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
