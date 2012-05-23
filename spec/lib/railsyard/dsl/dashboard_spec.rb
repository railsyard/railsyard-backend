require 'spec_helper'

describe Railsyard::Backend::Dsl::Dashboard do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::Dashboard.new(config) }

  describe ".group" do
    it "adds a Config::DashboardGroup" do
      group = stub
      Railsyard::Backend::Config::DashboardGroup.expects(:new).with(:foo).returns(group)
      config.expects(:add_row).with(group)
      subject.group(:foo)
    end
  end

end
