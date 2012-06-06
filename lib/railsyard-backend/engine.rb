require 'rails'
require 'sass-rails'
require 'slim'
require 'simple_form'
require 'jquery-rails'
require 'compass-rails'
require 'coffee-rails'
require 'blockenspiel'
require 'responders'
require 'formalize-rails'
require 'humane-rails'
require 'kaminari'
require 'cells'

module Railsyard::Backend
  class Engine < ::Rails::Engine

    initializer "Railsyard Backend precompile hook", :group => :assets do |app|
      app.config.assets.precompile += [
        "railsyard/html5.js",
        "railsyard/backend.css",
        "railsyard/backend.js"
      ]
    end

    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end

    # This reloads all the backend configuration files in development env
    config.to_prepare do
      Dir[Rails.root.join('app/backend/**/*.rb')].each { |f| require_dependency f }
    end

  end
end
