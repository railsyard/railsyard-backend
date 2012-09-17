require 'railsyard/engine'

module Railsyard

  mattr_accessor :authentication_adapter
  mattr_accessor :authenticator_initializer

  mattr_accessor :authorization_adapter
  mattr_accessor :authorizer_initializer

  mattr_accessor :sidebar
  mattr_accessor :dashboard

  def self.editor_manager
    require 'railsyard/editor_manager'
    @@editor_manager ||= EditorManager.new
  end

  def self.define_editor_for(*args, &block)
    editor_manager.define_editor_for(*args, &block)
  end

  def self.define_instance_editor_for(*args, &block)
    editor_manager.define_instance_editor_for(*args, &block)
  end

  def self.plugin_manager
    require 'railsyard/plugin/manager'
    @@plugin_manager ||= Plugin::Manager.new
  end

  def self.define_sidebar(&block)
    require 'railsyard/config/sidebar'
    @@sidebar = Config::Sidebar.new(&block)
  end

  def self.define_dashboard(&block)
    require 'railsyard/config/dashboard'
    @@dashboard = Config::Dashboard.new(&block)
  end

  def self.export_manager
    require 'railsyard/export/manager'
    @@export_manager ||= Export::Manager.new
  end

end
