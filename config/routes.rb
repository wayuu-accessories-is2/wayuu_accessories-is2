Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"}

  root to: 'hometeam#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin/index', to: 'admin#admin_index'


  get 'product/edit/:id', to: 'category#edit'
  get 'category/edit/:id', to: 'category#edit'
  get 'category/status/:id', to: 'category#status'

  



  resources :product do
    collection do
      get 'add', to: :add
      post 'new', to: :new
      get 'show', to: :show
      post 'update', to: :update
    end
  end

  resources :category do
    collection do
      get 'add', to: :add
      post 'new', to: :new
      get 'show', to: :show
      post 'update', to: :update

    end
  end

end
