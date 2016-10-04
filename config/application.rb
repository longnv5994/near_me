require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Appnearme
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    Warden::Manager.serialize_into_session do |user|
      user.id
    end

    Warden::Manager.serialize_from_session do |id|
      User.find_by_id id
    end
    # Add Warden in the middleware stack
    config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
      manager.default_strategies :authentication_token
      manager.failure_app = UnauthorizedController
    end
  end
end
