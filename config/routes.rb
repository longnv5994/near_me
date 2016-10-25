Rails.application.routes.draw do
  root "static_pages#home"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "signout", to: "sessions#destroy", as: "signout"
  # post "friends", to: "friends#show"
  get "friends", to: "friends#show"
  resource :sessions, only: [:new, :create, :destroy]
end
