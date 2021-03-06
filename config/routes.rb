Rails.application.routes.draw do
  resources :products
   resource :users, only: [:create]
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"
  get "/groceries", to: "groceries#index"
  post "/groceries", to: "groceries#create"
  resources :groceries
  resources :books
end
