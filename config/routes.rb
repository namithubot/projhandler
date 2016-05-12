Rails.application.routes.draw do
  #get 'sign_in/index'
  resources :add_project
  resources :my_group
  resources :members #only: [:new, :create, :update, :show, :index, :destroy]
  #get 'my_group/:id' => 'member#edit'
  get 'login' => 'sign_in#new'
  post 'login' => 'sign_in#create'
  delete 'logout' => 'sign_in#destroy'
  get 'signup' => 'home#new'
  post 'signup' => 'home#create'
  get 'forgot_password' => 'sign_in#edit'
  patch 'forgot_password' => 'sign_in#update'
  get 'access' => 'home#edit'
  post 'access' => 'home#update'
  get 'explore' => 'add_project#explore'
  #get 'members' => 'members#show'
  #get 'edit_members' => 'members#edit'
  #patch 'members' => 'members#update'
  #delete 'members' => 'members#destroy'
 root 'sign_in#new'
  #post 'my_group/join/:id' => 'my_group#join'
  #get '/add_project/:id', to: 'add_project#destroy'
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
