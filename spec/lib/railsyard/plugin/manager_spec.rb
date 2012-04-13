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

end
