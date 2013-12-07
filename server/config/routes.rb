Server::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'donations#welcome'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  get 'admin' => 'admin#index'
  get 'team/:id' => 'teams#profile'
  get 'donations/new' => 'donations#new'
  get 'donations/thanks' => 'donations#thanks'

  # Example resource route (maps HTTP verbs to controller actions automatically):
  namespace :admin do
    resources :challenges
    resources :donations
    resources :incentives
    resources :users
    resources :teams
  end

  namespace :api do
    post 'user.:format' => 'users#create'
    get 'user.:format' => 'users#show'

    post 'donate.:format' => 'donations#create'
    get 'donations/for_donor.:format' => 'donations#show_for_donor'
    get 'donations/for_referrer.:format' => 'donations#show_for_referrer'
  end
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
