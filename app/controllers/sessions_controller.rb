class SessionsController < ApplicationController
  def create
    user = User.from_omniauth env["omniauth.auth"]
    authenticate!
    redirect_to welcome_index_path
  end

  def destroy
    warden.logout
    redirect_to root_path
  end
end
