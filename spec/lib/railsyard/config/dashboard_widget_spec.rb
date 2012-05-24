require 'spec_helper'

describe Railsyard::Backend::Config::DashboardWidget do

  subject { Railsyard::Backend::Config::DashboardWidget.new(:foo, :bar) }

  it "takes a type" do
    subject.type.should == :foo
  end

  it "takes a name" do
    subject.name.should == :bar
  end

end
