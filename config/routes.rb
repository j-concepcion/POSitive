Rails.application.routes.draw do
  get 'static_pages/sales'
  get 'static_pages/weekly'
  get 'static_pages/monthly'
  get 'static_pages/table'
  get 'static_pages/takeout'
  get 'static_pages/one'
  get 'static_pages/two'
  get 'static_pages/three'
  get 'static_pages/four'
  get 'static_pages/five'
  get 'static_pages/six'
  get 'static_pages/seven'

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
