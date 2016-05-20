Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_for :user, skip: :registrations, controllers: {
    sessions:  'backend/devise/sessions',
    passwords: 'backend/devise/passwords'
  }
  devise_scope :user do
    get  '/sign_in', to: 'backend/devise/sessions#new', as: 'sign_in'
  end

  mount Ckeditor::Engine => '/ckeditor'

  scope "/admin", module: :backend do
    get '/', to: 'dashboard#index', as: :dashboard

    resources :posts
    resources :previews,   only: [:create]
    resources :categories
    resources :tags
    resources :comments,   except: [:show, :new, :create]
    resources :activities
    resources :news,       except: [:show]
    resources :users

    mount Resque::Server.new, :at => "resque"
  end

  scope module: :frontend do
    root to: 'webs#index'

    scope module: :webs do
      get  'about_us'
      get  'contact_us'
      post 'send_email'
    end

    post '/:post_id/comment',  to: 'comments#create', as: :post_comments
    get  '/preview/:token',    to: 'previews#show'
    get  '/categories',        to: 'categories#index'
    get  '/tags',              to: 'tags#index'
    get  '/tags/:name',        to: 'tags#show'
    get  '/activities',        to: 'activities#index'
    get  '/activities/:id',    to: 'activities#show', as: :frontend_activity
    get  '/news',              to: 'news#index',      as: :frontend_news
    get  '/date/:year/:month', to: 'webs#date'
    get  '/search',            to: 'search#index',    as: :search
    get  '/:id/:handle',       to: 'posts#show',      as: :frontend_post
    get  '/:handle',           to: 'categories#show', as: :frontend_category
  end

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
