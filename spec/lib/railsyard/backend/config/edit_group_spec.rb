require 'spec_helper'

describe Railsyard::Backend::Config::EditGroup do

  subject { Railsyard::Backend::Config::EditGroup.new(:foo) }

  it "takes a name" do
    subject.name.should == :foo
  end

  it "lets you add fields, and get them back via .field and .fields" do
    field = stub(:name => :foo)
    subject.add_field(field)
    subject.fields.should have(1).field
    subject.fields.first.should == field
    subject.field(:foo).should == field
  end

  it "lets you add nested_fields, and get them back via .field and .fields" do
    field = stub(:name => :foo)
    subject.add_nested(field)
    subject.fields.should have(1).field
    subject.fields.first.should == field
    subject.field(:foo).should == field
  end

end
