require 'spec_helper'

describe Railsyard::Backend::Dsl::Sidebar do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::Sidebar.new(config) }

  describe ".group" do
    it "adds a Config::SidebarGroup" do
      group = stub
      Railsyard::Backend::Config::SidebarGroup.expects(:new).with(:foo).returns(group)
      config.expects(:add_group).with(group)
      subject.group(:foo)
    end
  end

end
