Rails.application.routes.draw do
  get 'chats/all'

  get 'chats/view'

  get 'chats/new'

  get 'chats/create'

  get 'chats/update'

  get 'chats/delete'

  get 'invitations/all'

  get 'invitations/view'

  get 'invitations/new'

  get 'invitations/create'

  get 'invitations/update'

  get 'invitations/delete'

  get 'saves/all'

  get 'saves/view'

  get 'saves/new'

  get 'saves/create'

  get 'saves/update'

  get 'saves/delete'

  get 'joins/all'

  get 'joins/view'

  get 'joins/new'

  get 'joins/create'

  get 'joins/update'

  get 'joins/delete'

  get 'likes/all'

  get 'likes/view'

  get 'likes/new'

  get 'likes/create'

  get 'likes/update'

  get 'likes/delete'

  get 'emetrics/all'

  get 'emetrics/view'

  get 'emetrics/new'

  get 'emetrics/create'

  get 'emetrics/update'

  get 'emetrics/delete'

  get 'emetricss/all'

  get 'emetricss/view'

  get 'emetricss/new'

  get 'emetricss/create'

  get 'emetricss/update'

  get 'emetricss/delete'

  get 'events/all'

  get 'events/view'

  get 'events/new/:picture_id'=>"events#new"

  get 'events/create'

  get 'events/update'

  get 'events/delete'

  get 'groups/all'

  get 'groups/view/:name'=>"groups#view"

  get 'groups/new'

  get 'groups/create'

  get 'groups/update'

  get 'groups/delete'

  get 'pictures/new'

  get 'pictures/create'

  get 'pictures/update'

  get 'pictures/delete'

  get 'pictures/view/:picture_id'=>"pictures#view"

  get 'pictures/all'

  get 'friends/find/'=>"friends#find"

  get 'friends/all'

  get 'friends/view'

  get 'friends/new'

  get 'friends/create'

  get 'friends/delete'

  get 'friends/update'

  get 'circles/index'

  get 'circles/new'

  get 'circles/create'

  get 'circle/index'

  get 'circle/new'

  get 'circle/create'

  get 'homes/calendar'

  root :to=>"homes#calendar"
  devise_for :users
  match '/pictures/create' => 'pictures#create', :via=>[:get,:post];
  match '/homes/calendar' => 'homes#calendar', :via=>[:get,:post];
  match '/friends/search' => 'friends#search', :via=>[:get,:post];
  
     

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
