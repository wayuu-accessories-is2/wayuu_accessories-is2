Rails.application.routes.draw do

  namespace :api, defaults:{ format: :json }do
    namespace :v1 do
      resources :products, :only => [:show,:index]
      resources :category_has_products, :only => [:show,:index]
    end
  end


  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"}

  scope 'admin' do
    resources :product do
      collection do
        get 'add', to: :add
        post 'new', to: :new
        post 'update', to: :update
        post 'change', to: :change
        get 'list', to: :list
        get 'status', to: :status
        get 'showimage', to: :showimage
        post 'sortimages', to: :sortimages
      end
    end
  end
  #assert_generates '../category/status', controller: 'category', action: 'status'
  resources :product do
    member do
        get 'show', to: :show
    end
  end

  scope 'admin' do
    resources :category do
      collection do
        get 'add', to: :add
        post 'new', to: :new
        post 'update', to: :update
        get 'list', to: :list
        get 'status', to: :status
        post 'change', to: :change
      end
    end
  end

  resources :review, only: [] do
    collection do
      get 'create', to: :create
    end
  end

  resources :checkout, only: [] do
    collection do
      get 'index', to: :index
      get 'first', to: :first
      post 'first_data', to: :first
      get 'second', to: :second
      post 'second_data', to: :second_data
    end
  end

  resources :category, only: [] do
    resources :product, only: [] do
      collection do
        get 'showforcategory', to: :showforcategory
      end
    end
  end

  root to: 'home_page#home'

  get 'home', to: 'home_page#home'

  get 'team', to: 'hometeam#index'
  get 'admin/index', to: 'admin#admin_index'

  resources :admin do
    collection do
      get 'userlist', to: :user
      get 'beadmin', to: :beadmin
      get 'removeadmin', to: :removeadmin
    end
  end


  resources :product_images

end
