require 'spec_helper'

describe Railsyard::Backend do

  describe ".backend" do
    it "returns a Railsyard::Backend" do
      backend = Railsyard::Backend.editor_manager
      backend.should be_a Railsyard::Backend::EditorManager
    end
  end

  describe ".plugin_manager" do
    it "returns a Plugin::Manager" do
      manager = Railsyard::Backend.plugin_manager
      manager.should be_a Railsyard::Backend::Plugin::Manager
    end
  end

  it "can store custom settings" do
    swap Railsyard::Backend, authentication_adapter: :foo, authorizer_initializer: :bar do
      Railsyard::Backend.authentication_adapter.should == :foo
      Railsyard::Backend.authorizer_initializer.should == :bar
    end
  end

  describe ".define_sidebar" do
    it "returns a Config::Sidebar" do
      Railsyard::Backend.define_sidebar
      Railsyard::Backend.sidebar.should be_a Railsyard::Backend::Config::Sidebar
    end
  end

  describe ".export_manager" do
    it "returns a Export::Manager" do
      manager = Railsyard::Backend.export_manager
      manager.should be_a Railsyard::Backend::Export::Manager
    end
  end

end
