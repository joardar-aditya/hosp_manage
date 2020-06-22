Rails.application.routes.draw do
  root 'sessions#new'
  resources :patients
  resources :users
  resources :admins
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
