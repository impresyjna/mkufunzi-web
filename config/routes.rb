Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/about'

  resources :users
  root 'welcome#index'
end
