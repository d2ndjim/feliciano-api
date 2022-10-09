Rails.application.routes.draw do
  resources :orders, only: [:index, :create, :destroy]
  resources :menus, only: [:index, :create]
  resources :users, only: [:index]



  #public routes
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"

  #admin routes
  delete "admin/menu" => "menus#destroy"
  get "admin/orders" => "orders#all_orders"
  #users routes
  get "/vegetarian" => "menus#vegetarian"
  get "/non_vegetarian" => "menus#non_vegetarian"
  get "/desserts" => "menus#dessert"
  get "/drinks" => "menus#drink"
  get "/wines" => "menus#wine"
end
