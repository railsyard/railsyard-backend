require "rails"
require "sass-rails"
require "slim"
require "simple_form"
require "jquery-rails"
require "compass-rails"
require "coffee-rails"
require "blockenspiel"
require "responders"

module Railsyard
  class Engine < ::Rails::Engine

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end

    # This reloads all the backend configuration files in development env

    config.to_prepare do
      Dir[Rails.root.join("app/backend/**/*.rb")].each { |f| require_dependency f }
    end

  end
end
