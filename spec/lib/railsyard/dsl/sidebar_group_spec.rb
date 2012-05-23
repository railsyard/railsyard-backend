require 'spec_helper'

describe Railsyard::Backend::Dsl::SidebarGroup do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::SidebarGroup.new(config) }

  describe ".instance" do
    it "adds an instance Config::SidebarItem to config" do
      item = stub
      Railsyard::Backend::Config::SidebarItem.expects(:new).with(:instance, :foo).returns(item)
      config.expects(:add_item).with(item)
      subject.instance(:foo)
    end
  end

  describe ".resource" do
    it "adds a resource Config::SidebarItem to config" do
      item = stub
      Railsyard::Backend::Config::SidebarItem.expects(:new).with(:resource, :foo).returns(item)
      config.expects(:add_item).with(item)
      subject.resource(:foo)
    end
  end

end
