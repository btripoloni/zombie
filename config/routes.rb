Rails.application.routes.draw do
  #resources :blogs, only: [:new, :create, :edit, :update]
  scope :blogs, as: :blog do
    get '/new' => 'blogs#new'
    post '/' => 'blogs#create'
    get '/edit' => 'blogs#edit'
    put '/' => 'blogs#update'
  end

  # Fix this
  get 'install' => 'install#index', as: :install
  post 'install' => 'install#create', as: :infos

  scope :admin, as: :admin do
    get '/' => 'admin#index'
    scope :edit_blog_info, as: :blog do
      get '/' => 'admin#edit_blog_info_new'
      post '/' => 'admin#edit_blog_info_updte'
    end
  end

  resources :posts do
    post "comments" => 'comments#create'
  end
  delete "comments/:id" => 'comments#delete', as: :comment
  root 'posts#index'
  
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
