Rails.application.routes.draw do
  devise_for :users
  root to: "entities#index"
  resources :groups
  resources :entities
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
