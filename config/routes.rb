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
        get 'show', to: :show
        post 'update', to: :update
        post 'change', to: :change
        get 'list', to: :list
        get 'status', to: :status
        post 'sortimages', to: :sortimages
      end
    end
  end
  #assert_generates '../category/status', controller: 'category', action: 'status'

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

  resources :category, only: [] do
    resources :product, only: [] do
      collection do
        get 'showforcategory', to: :showforcategory
      end
    end
  end

  root to: 'home_page#home'

  get 'team', to: 'hometeam#index'

  get 'admin/index', to: 'admin#admin_index'

  resources :product_images

end
