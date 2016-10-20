Rails.application.routes.draw do
  root "static_pages#home"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "signout", to: "sessions#destroy", as: "signout"
  post "locations/new", to: "locations#new"
  resource :sessions, only: [:new, :create, :destroy]
end
