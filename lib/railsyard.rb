require "railsyard/engine"

module Railsyard

  mattr_accessor :authentication_adapter
  mattr_accessor :authenticator_initializer

  mattr_accessor :authorization_adapter
  mattr_accessor :authorizer_initializer

  def self.backend
    require "railsyard/backend"
    @@backend ||= Backend::Base.new
  end

  def self.plugin_manager
    require "railsyard/plugin/manager"
    @@plugin_manager ||= Plugin::Manager.new
  end

end
