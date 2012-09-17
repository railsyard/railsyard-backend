require 'spec_helper'

describe Railsyard::Dsl::SidebarGroup do

  let(:config) { stub }
  subject { Railsyard::Dsl::SidebarGroup.new(config) }

  describe ".instance" do
    it "adds an instance Config::SidebarModel to config" do
      model = stub
      Railsyard::Config::SidebarModel.expects(:new).with(:instance, :foo).returns(model)
      config.expects(:add_item).with(model)
      subject.instance(:foo)
    end
  end

  describe ".resource" do
    it "adds a resource Config::SidebarModel to config" do
      model = stub
      Railsyard::Config::SidebarModel.expects(:new).with(:resource, :foo).returns(model)
      config.expects(:add_item).with(model)
      subject.resource(:foo)
    end
  end

  describe ".link" do
    it "adds a link Config::SidebarLink to config" do
      link = stub
      Railsyard::Config::SidebarLink.expects(:new).with(:link, "Railsyard", "http://railsyardcms.org").returns(link)
      config.expects(:add_item).with(link)
      subject.link("Railsyard", "http://railsyardcms.org")
    end
  end

end
