require 'spec_helper'

describe Railsyard do

  describe ".backend" do
    it "returns a Railsyard" do
      backend = Railsyard.editor_manager
      backend.should be_a Railsyard::EditorManager
    end
  end

  describe ".plugin_manager" do
    it "returns a Plugin::Manager" do
      manager = Railsyard.plugin_manager
      manager.should be_a Railsyard::Plugin::Manager
    end
  end

  it "can store custom settings" do
    swap Railsyard, authentication_adapter: :foo, authorizer_initializer: :bar do
      Railsyard.authentication_adapter.should == :foo
      Railsyard.authorizer_initializer.should == :bar
    end
  end

  describe ".define_dashboard" do
    it "returns a Config::Dashboard" do
      swap Railsyard, dashboard: nil do
        Railsyard.define_dashboard
        Railsyard.dashboard.should be_a Railsyard::Config::Dashboard
      end
    end
  end

  describe ".define_sidebar" do
    it "returns a Config::Sidebar" do
      swap Railsyard, sidebar: nil do
        Railsyard.define_sidebar
        Railsyard.sidebar.should be_a Railsyard::Config::Sidebar
      end
    end
  end

  describe ".export_manager" do
    it "returns a Export::Manager" do
      manager = Railsyard.export_manager
      manager.should be_a Railsyard::Export::Manager
    end
  end

end
