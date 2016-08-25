Rails.application.routes.draw do
  get 'hometeam/index', to: 'hometeam#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin/index', to: 'admin#admin_index'
end
