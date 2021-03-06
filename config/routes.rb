Rails.application.routes.draw do

  
  devise_for :users, controllers: { registrations: "registrations", 
                    omniauth_callbacks: "omniauth_callbacks"}

  root 'static_pages#home'

  get 'newsfeed' => 'users#newsfeed'
  get 'notifications' => 'users#notifications'
  get 'friends' => 'users#friend_list'
  get 'profiles/:id' => 'profiles#show'
  post 'friendships/:id' => 'friendships#accept'
  get 'friendships/create'
  get 'likes' => 'likes#create'

  resources :profiles, :only => [:edit, :update]
  resources :posts, :only => [:new, :create, :destroy]
  resources :comments, :only => [:new, :create, :destroy]
  resources :users, :only => [:index]
  resources :friendships, :only => [:new, :create, :destroy]
  resources :likes, :only => [:new, :create, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
