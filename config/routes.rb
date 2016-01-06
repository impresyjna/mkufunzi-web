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

  get 'measurement' => 'measurements#show'
  post 'measurement' => 'measurements#create'
  get 'my_protege_card' => 'measurements#my_protege_card'

  get  'new_measurement' => 'cards#new'
  post 'new_measurement' => 'cards#create'
  get 'login_mobile' => 'users#login_mobile'
  get 'new_measure_type' => 'measure_types#new'
  get 'measure_type' => 'measure_types#show'

  get 'my_proteges' => 'proteges#my_proteges'
  post 'my_proteges' => 'proteges#add_trainer_to_protege'
  post 'erase_trainer_from_protege' => 'proteges#erase_trainer_from_protege'

  get 'trainers' => 'trainers#show_trainer'
  post 'activate_trainer' => 'trainers#activate_trainer'

  post 'register_mobile' => 'users#register_mobile'
  get 'measure_types_index' => 'measure_types#index_mobile'
  get 'get_measurements_mobile' => 'measurements#get_measurements_mobile'
  post 'post_measurement_mobile' => 'measurements#post_measurement_mobile'

  get 'my_medicines' => 'medicines#show'
  post 'my_medicines' => 'medicines#new'
  post 'new_medicine_times' => 'medicine_times#create'
  
  resources :users
  resources :measurements
  resources :card_indices
  resources :cards
  resources :measure_types
  resources :proteges
  resources :static_pages
  resources :trainers
  resources :medicines
  
end
