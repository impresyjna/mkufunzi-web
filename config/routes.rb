Rails.application.routes.draw do

  get 'protege/show'

  get 'protege/create'

  root             'static_pages#home'
  get 'start' => 'static_pages#home'
  post 'new_protege' => 'proteges#create'
  post 'new_trainer' => 'trainers#create'

  get 'contact' => 'static_pages#contact'
  get 'about'   => 'static_pages#about'
  get 'signup'  => 'users#new'
  post 'signup'  => 'users#create'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'new_card_index' => 'card_indices#new'
  get 'card_indices' => 'card_indices#show'
  get 'measurement' => 'measurements#show'
  post 'measurement' => 'measurements#create'

  get  'new_measurement' => 'cards#new'
  post 'new_measurement' => 'cards#create'
  get 'login_mobile' => 'users#login_mobile'
  get 'new_measure_type' => 'measure_types#new'
  get 'measure_type' => 'measure_types#show'

  get 'my_proteges' => 'trainers#my_proteges'
  post 'my_proteges' => 'trainers#add_protege'
  post 'register_mobile' => 'users#register_mobile'
  get 'measure_types_index' => 'measure_types#index_mobile'
  

  resources :users
  resources :measurements
  resources :card_indices
  resources :cards
  resources :measure_types
  resources :proteges
  resources :static_pages
  resources :trainers
  
end
