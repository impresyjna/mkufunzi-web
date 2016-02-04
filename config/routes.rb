Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'active_excercises' => 'active_excercises#show'
  get 'active' => 'active_excercises#active'

  get 'excercise_types' => 'excercise_types#show'
  post 'excercise_types' => 'excercise_types#new'
  patch 'update_excercise_types' => 'excercise_types#update'
  delete 'excercise_types' => 'excercise_types#delete'
  get 'protege/show'
  get 'protege/create'

  root 'static_pages#home'
  get 'start' => 'static_pages#home'
  post 'new_protege' => 'proteges#create'
  post 'new_trainer' => 'trainers#create'

  get 'signup'  => 'users#new'
  post 'signup'  => 'users#create'
  get 'profile' => 'users#show'
  get 'edit_profile' => 'users#edit'

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
  get 'edit_measure_type' => 'measure_types#edit'
  patch 'edit_measure_type' => 'measure_types#update'
  delete 'measure_type' => 'measure_types#destroy'

  get 'my_proteges' => 'proteges#my_proteges'
  post 'my_proteges' => 'proteges#add_trainer_to_protege'
  post 'erase_trainer_from_protege' => 'proteges#erase_trainer_from_protege'
  post 'update_protege' => 'proteges#update'

  get 'trainers' => 'trainers#show_trainer'
  post 'activate_trainer' => 'trainers#activate_trainer'
  post 'disactivate_trainer' => 'trainers#disactivate_trainer'

  post 'register_mobile' => 'users#register_mobile'
  get 'measure_types_index' => 'measure_types#index_mobile'
  get 'get_measurements_mobile' => 'measurements#get_measurements_mobile'
  post 'post_measurement_mobile' => 'measurements#post_measurement_mobile'

  get 'my_medicines' => 'medicines#show'
  post 'my_medicines' => 'medicines#new'
  post 'new_medicine_times' => 'medicine_times#create'
  delete 'my_medicines' => 'medicines#destroy'
  delete 'delete_medicine_time' => 'medicine_times#destroy'

  get 'messages' => 'messages#show'
  post 'send_message' => 'messages#new'
  get 'message' => 'messages#new_message'

  get 'user_exists_mobile' => 'users#user_exists_mobile'
  get 'get_main_data' => 'measurements#get_main_data'
  get 'get_blood_types_mobile' => 'blood_types#get_blood_types_mobile'
  get 'get_eye_colors_mobile' => 'eye_colors#get_eye_colors_mobile'
  post 'update_from_mobile' => 'proteges#update_from_mobile'

  get 'done_excercises' => 'done_excercises#show'

  get 'training' => 'trainings#show'
  get 'training_details' => 'trainings#show_details'

  post 'create_active_excercise_mobile' => 'active_excercises#create_active_excercise_mobile'
  post 'update_active_excercise_mobile' => 'active_excercises#update_active_excercise_mobile'
  post 'create_training_mobile' => 'trainings#create_training_mobile'
  post 'end_training_mobile' => 'trainings#end_training_mobile'
  post 'end_active_excercise_mobile' => 'active_excercises#end_active_excercise_mobile'
  get 'my_messages_index_mobile' => 'messages#my_messages_index_mobile'
  post 'create_message_mobile' => 'messages#create_message_mobile'
  get 'excercise_types_index_mobile' => 'excercise_types#excercise_types_index_mobile'
  get 'trainings_index_mobile' => 'trainings#trainings_index_mobile'

  resources :users
  resources :measurements
  resources :card_indices
  resources :cards
  resources :measure_types
  resources :proteges
  resources :static_pages
  resources :trainers
  resources :medicines
  resources :messages
  resources :account_activations, only: [:edit]
  resources :excercise_types
  resources :excercises
  resources :trainings
  resources :done_excercises
  resources :active_excercises
  resources :password_resets,     only: [:new, :create, :edit, :update]

end
