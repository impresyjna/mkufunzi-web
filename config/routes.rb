Rails.application.routes.draw do
  root             'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'about'   => 'static_pages#about'
  get 'signup'  => 'users#new'

  resources :users
end
