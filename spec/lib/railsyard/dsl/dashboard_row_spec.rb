require 'spec_helper'

describe Railsyard::Backend::Dsl::DashboardRow do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::DashboardRow.new(config) }

  describe ".instance" do
    it "adds an instance Config::DashboardWidget to config" do
      widget = stub
      Railsyard::Backend::Config::DashboardWidget.expects(:new).with(:instance, :foo).returns(widget)
      config.expects(:add_widget).with(widget)
      subject.instance(:foo)
    end
  end

  describe ".resource" do
    it "adds a resource Config::DashboardWidget to config" do
      widget = stub
      Railsyard::Backend::Config::DashboardWidget.expects(:new).with(:resource, :foo).returns(widget)
      config.expects(:add_widget).with(widget)
      subject.resource(:foo)
    end
  end

end
