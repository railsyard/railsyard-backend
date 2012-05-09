require 'railsyard-backend/engine'

module Railsyard
  module Backend

    mattr_accessor :authentication_adapter
    mattr_accessor :authenticator_initializer

    mattr_accessor :authorization_adapter
    mattr_accessor :authorizer_initializer

    def self.editor_manager
      require 'railsyard-backend/editor_manager'
      @@editor_manager ||= Backend::EditorManager.new
    end

    def self.define_editor_for(*args, &block)
      editor_manager.define_editor_for(*args, &block)
    end

    def self.define_instance_editor_for(*args, &block)
      editor_manager.define_instance_editor_for(*args, &block)
    end

    def self.plugin_manager
      require 'railsyard-backend/plugin/manager'
      @@plugin_manager ||= Plugin::Manager.new
    end

  end
end
