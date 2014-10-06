Rails.application.routes.draw do

  get 'static_pages/sales_report', to: 'static_pages#sales_report', as: 'sales_report'
  get 'static_pages/sales', to: 'static_pages#sales', as: 'daily_sales'
  get 'static_pages/monthly', to: 'static_pages#monthly', as: 'monthly_sales'
  get 'static_pages/table', to: 'static_pages#table', as: 'dine_in'
  get 'static_pages/takeout', to: 'static_pages#takeout', as: 'takeout'
  get 'static_pages/one', to: 'static_pages#one', as: 'table_one'
  get 'static_pages/two', to: 'static_pages#two', as: 'table_two'
  get 'static_pages/three', to: 'static_pages#three', as: 'table_three'
  get 'static_pages/four', to: 'static_pages#four', as: 'table_four'
  get 'static_pages/five', to: 'static_pages#five', as: 'table_five'
  get 'static_pages/six', to: 'static_pages#six', as: 'table_six'
  get 'static_pages/seven', to: 'static_pages#seven', as: 'table_seven'

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
