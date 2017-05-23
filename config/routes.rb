Rails.application.routes.draw do
  resources :author_books
  post 'fill_author_form' => 'books#fill_author_form'
  post 'fill_hall_form' => 'shelves#fill_hall_form'
  resources :locations
  resources :books do
    collection do
      get :search
      post :search
    end
  end

  resources :authors
  resources :shelves do
    member do
      get :get_books
    end
  end
  resources :halls
  resources :role_users
  resources :roles
  resources :password_resets

  get 'welcome/index', as: :welcome
  get 'welcome/insufficient_privileges', as: :ip
  get 'login' => 'welcome#new', :as => :login
  get 'logout' => 'welcome#destroy', :as => :logout
  post 'try_login' => 'welcome#create', :as => :try_login
  root 'welcome#index'

  resources :users do
    member do
      get :activate
    end
    collection do
      post :create_by_admin
      get :new_by_admin
    end
  end


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
