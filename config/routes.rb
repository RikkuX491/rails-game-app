Rails.application.routes.draw do
  resources :reviews
  #resources :users
  
  resources :games
  # get "games", to: "games#index"
  # get "games/:id", to: "games#show"
  # post "games", to: "games#create"
  # patch "games/:id", to: "games#update"
  # delete "games/:id", to: "games#destroy"
  
  get "/get_last_game", to: "games#last_game"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get "/me", to: "users#show"

  post "/signup", to: "users#create"
end
