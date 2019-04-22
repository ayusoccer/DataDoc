Rails.application.routes.draw do
  root 'welcome#index'
  post '/treatments/:id/patients', to: 'treatments#add_patient'
  delete '/treatments/:id/patients/:patient_id', to: 'treatments#delete_patient'
  post '/patients/:id/treatments', to: 'patients#add_treatment'
  delete '/patients/:id/treatments/:treatment_id', to: 'patients#delete_treatment'
  resources :treatments
  resources :patients do
    resources :reports, only: [:edit, :create, :update, :destroy]
    resources :billingstatements, only: [:edit, :create, :update, :destroy]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
