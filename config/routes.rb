Rails.application.routes.draw do
  #get 'home_page/home'
  root to: 'home_page#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin/index', to: 'admin#admin_index'
end
