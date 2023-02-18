Rails.application.routes.draw do
  resources :reviews
  resources :users
  resources :games

  get "/get_last_game", to: 'games#last_game'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
