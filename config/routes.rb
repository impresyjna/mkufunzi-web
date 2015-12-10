Rails.application.routes.draw do

  root             'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'about'   => 'static_pages#about'
  get 'signup'  => 'users#new'
  post 'signup'  => 'users#create'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'new_card_index' => 'card_indices#new'
  get 'card_indices' => 'card_indices#show'
  get 'cards' => 'cards#show'
  get  'new_measurement' => 'cards#new'
  post 'new_measurement' => 'cards#create'
  
  resources :users
  resources :card_indices
  resources :cards
end
