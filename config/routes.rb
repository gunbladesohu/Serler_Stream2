Rails.application.routes.draw do

  get 'sessions/new'

  resources :search1_queries
  get 'search_queries/update_values' => 'search_queries#update_values'

  resources :search_queries
  resources :methodologies
  resources :dev_methods
  resources :research_methods
  resources :statuses
  resources :authors
  resources :articles
  resources :article_types
  resources :ratings
  resources :feedbacks
  resources :research_participants
  resources :roles
  resources :users
  root 'home#index'
  
  
  get '/google0c45e730084a93ab.html' ,   to: 'home#google0c45e730084a93ab'
  # get    '/login',   to: 'sessions#new'
  get    '/login',   to: 'home#login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get "users/new", as: "register"
  match ':controller(/:action(/:id))', :via => :get
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
  get 'admin/article_view_moderator', as:"article_view"
  get 'admin_controller/article_view'
  # get "admin/article_quality_check", as: "article_quality_check"
  get "admin/article_detail", as: "article_detail"

  get 'admin/add_dev_method'
  get 'admin/update_methodology'
  post 'admin/update_methodology'
  get 'admin/mail_send'
  get "admin/article_view/Moderator" , as: "article_view_moderator"
  get "admin/article_view_moderator" , as: "article_moderator_picked_up"
end
