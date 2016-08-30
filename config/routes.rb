Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"}

  root to: 'hometeam#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin/index', to: 'admin#admin_index'
  get 'admin/product/add', to: 'product#add'
  post 'product/new', to: 'product#new'
  get 'admin/category/add', to: 'category#add'
  post 'category/new', to: 'category#new'
  get 'admin/category/show', to: 'category#show'
  get 'category/edit/:id', to: 'category#edit', as: :cate
  post 'category/update/', to: 'category#update'
  get 'category/status/:id', to: 'category#status'
  get 'admin/product/show', to: 'product#show'
  get 'product/edit/:id', to: 'product#edit'
  post 'product/update/', to: 'product#update'
  get 'product/delete/:id', to: 'product#delete'

  post 'addproduct' => 'product#add'
end
