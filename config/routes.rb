Rails.application.routes.draw do
  resources :profiles
  resources :users
  resources :cities
  root "users#index"
end
