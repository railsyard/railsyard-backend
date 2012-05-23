require 'spec_helper'

describe Railsyard::Backend::Config::DashboardWidget do

  subject { Railsyard::Backend::Config::DashboardWidget.new(:foo, :bar) }

  it "takes a type" do
    subject.type.should == :foo
  end

  it "takes a model class" do
    subject.model_class.should == :bar
  end

end
