Rails.application.routes.draw do
  # defines all the CRUD routes for resources controller for users. only create create
  #controller called users, function that handles that request is called 'login'
  #autologin tests the login
    resource :users, only: [:create]
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
end
