Rails.application.routes.draw do
  root "static_pages#home"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")
  get "signout", to: "sessions#destroy", as: "signout"
  post "locations/get_position", to: "locations#get_position"
  resource :sessions, only: [:new, :create, :destroy]
end
