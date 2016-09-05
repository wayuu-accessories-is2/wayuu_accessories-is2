Rails.application.routes.draw do
  root to: 'home_page#home'
  get 'home', to: 'home_page#home'
end
