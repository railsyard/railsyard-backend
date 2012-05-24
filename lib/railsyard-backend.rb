require 'railsyard-backend/engine'

module Railsyard
  module Backend

    mattr_accessor :authentication_adapter
    mattr_accessor :authenticator_initializer

    mattr_accessor :authorization_adapter
    mattr_accessor :authorizer_initializer

    mattr_accessor :sidebar
    mattr_accessor :dashboard

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

    def self.define_sidebar(&block)
      require 'railsyard-backend/config/sidebar'
      @@sidebar = Config::Sidebar.new(&block)
    end

    def self.define_dashboard(&block)
      require 'railsyard-backend/config/dashboard'
      @@dashboard = Config::Dashboard.new(&block)
    end

    def self.export_manager
      require 'railsyard-backend/export/manager'
      @@export_manager ||= Export::Manager.new
    end

  end
end
