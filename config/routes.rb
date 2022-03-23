Rails.application.routes.draw do
  resources :scanned_cards
  # defines all the CRUD routes for resources controller for users. only create create
  #controller called users, function that handles that request is called 'login'
  #autologin tests the login
  resource :users, only: [:create]
  get "/auto_login",        to: "users#auto_login"
  post "/login",            to: "users#login"
end
