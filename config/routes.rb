Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"}

  root to: 'hometeam#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin/index', to: 'admin#admin_index'
  get 'product/add', to: 'product#add'
  post 'product/new', to: 'product#new'
end
