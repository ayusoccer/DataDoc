Rails.application.routes.draw do
  resources :treatments
  resources :billingstatements
  resources :patients
  resources :reports
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
