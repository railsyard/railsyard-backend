require 'spec_helper'

describe Railsyard::Backend::Dsl::Dashboard do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::Dashboard.new(config) }

  describe ".column" do
    it "adds a Config::DashboardColumn" do
      column = stub
      Railsyard::Backend::Config::DashboardColumn.expects(:new).returns(column)
      config.expects(:add_column).with(column)
      subject.column
    end
  end

end
