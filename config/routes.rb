Rails.application.routes.draw do
  resources :menus
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"
end
