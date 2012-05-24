require 'spec_helper'

describe Railsyard::Backend::Config::SidebarModel do

  subject { Railsyard::Backend::Config::SidebarModel.new(:foo, :bar) }

  it "takes a type" do
    subject.type.should == :foo
  end

  it "takes a model class" do
    subject.model_class.should == :bar
  end

end
