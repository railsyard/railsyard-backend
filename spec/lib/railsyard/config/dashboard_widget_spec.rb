require 'spec_helper'

describe Railsyard::Config::DashboardWidget do

  subject { Railsyard::Config::DashboardWidget.new(:foo, :bar) }

  it "takes a type" do
    subject.type.should == :foo
  end

  it "takes a name" do
    subject.name.should == :bar
  end

end
