BackChannelApp::Application.routes.draw do
  resources :votes

  resources :comments

  resources :lookups

  get "replies/create"

  get "replies/destroy"

  get "users/show"
  resources :replies

  get "microposts/create"

  get "microposts/destroy"

  get "microposts/increment"

  get "sessions/new"

  get "pages/home"

  get "pages/contact"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy, :increment]
  resources :relationships, :only => [:create, :destroy]
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
     root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

  match '/signup',  :to => 'users#new'
  match '/help',    :to => 'pages#contact'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/sessions', :to => 'sessions#create'
  match '/replies' , :to => 'replies#new'
  match '/users', :to => 'users#show'
  match '/createadmin', :to => 'users#create'
  match '/reports' , :to=> 'pages#reports'
  match '/comments', :to => 'comments#create'
  match '/search', :to => 'lookups#new'
  match '/microposts/:id', :to => 'microposts#increment'
  match '/comments/:id', :to => 'comments#increment'
  match ':controller(/:action(/:id))'
  match ':controller(/:action(/:id(.:format)))'
end
