Rails.application.routes.draw do
  resources :orders
  resources :menus, only: [:index, :create]

  #public routes
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"

  #admin routes
  # get "admin/menus" => "menus#index"
  #users routes
end
