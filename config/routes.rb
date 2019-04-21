Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :billingstatements
  post '/treatments/:id/patients', to: 'treatments#add_patient'
  delete '/treatments/:id/patients/:patient_id', to: 'treatments#delete_patient'
  post '/patients/:id/treatments', to: 'patients#add_treatment'
  delete '/patients/:id/treatments/:treatment_id', to: 'patients#delete_treatment'
  resources :treatments
  resources :patients
  resources :reports

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
