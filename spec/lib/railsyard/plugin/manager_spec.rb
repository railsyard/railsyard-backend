require 'spec_helper'

describe Railsyard::Plugin::Manager do

  describe ".add_plugin" do
    it "adds a Plugin::Config by name" do
      config = stub
      Railsyard::Plugin::Config.expects(:new).returns(config)
      subject.add_plugin(:foo)
      subject.plugins.first.should == config
    end
  end

  describe ".authentication_partial" do
    it "should return first valid authentication partial among all plugins" do
      plugins = {foo: stub(:authentication_partial),
                 bar: stub(authentication_partial: "partial/lmao")}
      subject.instance_variable_set(:@plugins, plugins)
      subject.authentication_partial.should == "partial/lmao"
    end
  end

  pending ".plugins"
  pending ".generator_editor_type"
  pending ".dashboard_widget"

end
