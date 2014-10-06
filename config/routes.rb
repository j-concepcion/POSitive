Rails.application.routes.draw do

  match 'sales_report' => 'static_pages#sales_report', :via => [:get]
  match 'daily_sales' => 'static_pages#sales', :via => [:get]
  match 'monthly_sales' => 'static_pages#monthly', :via => [:get]
  match 'dine_in' => 'static_pages#table', :via => [:get]
  match 'takeout' => 'static_pages#takeout', :via => [:get]
  match 'table_one' => 'static_pages#one', :via => [:get]
  match 'table_two' => 'static_pages#two', :via => [:get]
  match 'table_three' => 'static_pages#three', :via => [:get]
  match 'table_four' => 'static_pages#four', :via => [:get]
  match 'table_five' => 'static_pages#five', :via => [:get]
  match 'table_six' => 'static_pages#six', :via => [:get]
  match 'table_seven' => 'static_pages#seven', :via => [:get]

  resources :products
  resources :inventories
  resources :order_slip_items
  resources :order_slips do
    collection do
      get :close
    end
    member do
      post :split
      get :archive
      post :merge
      get :activate
    end

  end

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users do
    collection do
      get 'dashboard'
    end
  end
  authenticated :user do
    root :to => 'users#dashboard', :as => :authenticated_root
  end
  root :to => redirect('/login')

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
