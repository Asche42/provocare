Rails.application.routes.draw do
  resources :comments

  resources :offers

  resources :articles
  resources :profiles

  #resources :users
  devise_for :users, :skip => [:registration], controllers: {
    sessions: 'users/sessions'
  }

  get '/welcome/index'
  get '/welcome/who_are_we' => 'welcome#who_are_we'
  get '/welcome/innovate_together' => 'welcome#innovate_together'
  get '/welcome/job_theque' => 'welcome#job_theque'

  get '/admin/batch_processing' => 'admin#batch_processing'
  post '/admin/batch_processing' => 'admin#batch_processing'
  get '/admin/frontpage' => 'admin#frontpage'
  post '/admin/frontpage' => 'admin#frontpage'
  get '/admin/add_user' => 'admin#add_user'
  post '/admin/add_user' => 'admin#add_user'

  %w( 400 404 418 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
