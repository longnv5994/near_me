Rails.application.routes.draw do
  root "static_pages#home"
  get "welcome/index"

  get "home/show"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "signout", to: "sessions#destroy", as: "signout"
  resource :sessions, only: [:new, :create, :destroy]
end
