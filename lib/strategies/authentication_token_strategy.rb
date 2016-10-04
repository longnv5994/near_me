class AuthenticationTokenStrategy < ::Warden::Strategies::Base
  def valid?
    authentication_token
  end

  def authenticate!
    user = User.find_by_authentication_token authentication_token
    user.nil? ? fail!("Could not log in") : success!(user)
  end

  private
  def authentication_token
    Digest::SHA1.hexdigest("#{env["omniauth.auth"].uid}")
  end
end
