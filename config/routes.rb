Rails.application.routes.draw do
  resources :orders, only: [:index, :create, :destroy]
  resources :menus, only: [:index, :create]
  resources :users, only: [:index, :update, :destroy]
  
  #public routes
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"

  #admin routes
  delete "admin/menu" => "menus#destroy"
  get "admin/orders" => "orders#all_orders"
  #users routes
  get "/home_menu" => "menus#home_menu"
  get "menus/categorized" => "menus#categorized"
end
