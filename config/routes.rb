Rails.application.routes.draw do
  resources :orders
  resources :menus, only: [:index, :create]

  #public routes
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"

  #admin routes
  
  #users routes
  get "/vegetarian" => "menus#vegetarian"
  get "/non_vegetarian" => "menus#non_vegetarian"
  get "/desserts" => "menus#dessert"
  get "/drinks" => "menus#drink"
  get "/wines" => "menus#wine"
end
