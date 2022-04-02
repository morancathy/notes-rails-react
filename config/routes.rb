Rails.application.routes.draw do
  resources :card_details

  # defines all the CRUD routes for resources controller for users. only create create
  #controller called users, function that handles that request is called 'login'
  #autologin tests the login
  resource :users
  get "/auto_login",        to: "users#auto_login"
  get "/cards/:card_id",    to: "users#card"
  post "/login",            to: "users#login"
  post "/cardscan_session", to: "users#cardscan_session"
  # get "/users", to: "users#index"
end
