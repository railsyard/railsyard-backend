require 'spec_helper'

describe Railsyard do

  describe ".backend" do
    it "returns a Railsyard::Backend" do
      backend = Railsyard.backend
      backend.should be_a Railsyard::Backend::Base
    end
  end

  describe ".plugin_manager" do
    it "returns a Railsyard::Plugin::Manager" do
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

end
