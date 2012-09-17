require 'spec_helper'

describe Railsyard::Dsl::Dashboard do

  let(:config) { stub }
  subject { Railsyard::Dsl::Dashboard.new(config) }

  describe ".column" do
    it "adds a Config::DashboardColumn" do
      column = stub
      Railsyard::Config::DashboardColumn.expects(:new).returns(column)
      config.expects(:add_column).with(column)
      subject.column
    end
  end

end
