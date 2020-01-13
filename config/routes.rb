Rails.application.routes.draw do
  resources :districts
  resources :profiles
  resources :users
  resources :cities
  root "users#index"
end
