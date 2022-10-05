Rails.application.routes.draw do
  resources :orders
  resources :menus
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"
end
