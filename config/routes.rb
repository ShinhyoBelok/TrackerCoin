Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  get "/splash_screen", to: "splash_screen#index"
  resources :groups do
    resources :entities
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
