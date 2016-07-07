Rails.application.routes.draw do

  root 'sessions#index'

  get '/stripe', to: "stripe#index", as: 'stripe'
  get '/stripe/authorize', to: "stripe#authorize"
  get '/stripe/oauth/callback', to: "stripe#oauth_callback"

  get '/login', to: "sessions#login", as: 'login'
  get '/signup', to: "sessions#signup", as: 'signup'
  post '/login', to: "sessions#attempt_login"
  post '/signup', to: "sessions#create"
  get '/home', to: "sessions#index", as: 'home'
  delete '/logout', to: "sessions#logout", as: "logout"

  get 'overview' => 'overview#index'
  get 'finances' => 'finances#index'
  get 'settings' => 'settings#index'
  get 'users' => 'users#index'

  resources :users do
    resources :events, shallow: true
    resources :couples, shallow: true
    resources :assistants, shallow: true
    resources :packages, shallow: true
  end

  # get 'users/auth/:provider/callback', to: "billing#callback"
  resources :charges


  # get 'couples/:id', to: 'couples#show', as: :couple

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
