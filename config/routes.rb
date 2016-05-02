Rails.application.routes.draw do

  root to: "welcome#show"
  get '/packages', to: "packages#index"
  get '/packages/:id', to: "packages#show"

  get '/destinations/:id', to: "destinations#show"
  get '/:planet', to: "destinations#show", as: :planet
  # resources :planets, only: [:create]
  # get '/planets/:id', to: "destinations#show", as: :destination
  # get '/planets/:id' => 'destinations#show', as: :destination
  # get '/login', to: "sessions#new"
  # post '/login', to: "sessions#create"
  # get '/signup', to: "users#new"
 # get 'products/:id' => 'catalog#view'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # root to: "welcome#show"
  # get '/login', to: "sessions#new"
  # post '/login', to: "sessions#create"
  # get '/signup', to: "users#new"
  #
  # delete '/logout', to: 'sessions#destroy'
  #
  # resources :users, only: [:create, :update]
  # get '/dashboard', to: "users#show"
  #
  # namespace :admin do
  #   get '/dashboard', to: "users#show"
  #   resources :users, only: [:update, :delete]
  #   get '/orders' , to: "orders#index"
  # end
  #
  # get '/trip', to: "trip_packages#show"
  # resources :charges, only: [:new, :create]
  #
  # resources :packages, only: [:index, :show, :create]
  # resources :trip_packages, only: [:create, :destroy, :update]
  # resources :orders, only: [:show, :create]
  #
  # get '/orders' , to: "orders#index"
  #
  # get '/:planet', to: "destinations#show", as: :destination
  # resources
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
