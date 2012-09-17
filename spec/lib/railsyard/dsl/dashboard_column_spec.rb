require 'spec_helper'

describe Railsyard::Dsl::DashboardColumn do

  let(:config) { stub }
  subject { Railsyard::Dsl::DashboardColumn.new(config) }

  describe ".widget" do
    it "adds a Config::DashboardWidget to config" do
      widget = stub
      Railsyard::Config::DashboardWidget.expects(:new).with(:my_widget, :foobar).returns(widget)
      config.expects(:add_widget).with(widget)
      subject.widget(:my_widget, :foobar)
    end
  end

end
