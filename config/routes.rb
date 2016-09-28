Rails.application.routes.draw do

  root to: 'home_page#home'
  namespace :api, defaults:{ format: :json }do
      namespace :v1 do
        resources :products, :only => [:show,:index]
        resources :category_has_products, :only => [:show,:index]
      end
    end

  #  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"}


  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end

  scope "(:locale)",locale:/#{I18n.available_locales.join("|")}/ do
    resources :category, except:[:delete] do
      collection do
        get 'show', to: :show
      end
      resources :product, only:[]  do
        collection do
          get 'showall', to: :showall
        end
      end
    end

    resources :product, only:[]  do
      member do
        get 'show', to: :show
      end
    end

    resources :review, only: [] do
      collection do
        get 'create', to: :create
      end
    end

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

    post 'addtocart', to: 'application#addtocart'
    get 'addtocartget', to: 'application#addtocartget'
    get 'refreshcart', to: 'shop#refreshcart'
    get 'deletecart', to: 'shop#deletecart'

    resources :checkout, only: [] do
      collection do
        get 'index', to: :index
        get 'first', to: :first
        post 'first_data', to: :first
        get 'second', to: :second
        post 'second_data', to: :second_data
        get 'cart', to: :cart
      end
    end

    resources :category, only: [] do
      resources :product, only: [] do
        collection do
          get 'showforcategory', to: :showforcategory
        end
      end
    end
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
end
