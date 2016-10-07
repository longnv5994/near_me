require "bcrypt"
class User < ApplicationRecord
  include BCrypt

  before_create :generate_confirmation_token

  has_many :user_locations
  has_many :relationships
  has_many :friends, through: :relationships

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end

  private
  def generate_confirmation_token
    token = Digest::SHA1.hexdigest("#{self.uid}")
    self.authentication_token = token
  end
end
