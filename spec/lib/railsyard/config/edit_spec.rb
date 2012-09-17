require 'spec_helper'

describe Railsyard::Config::Edit do

  it "lets you add groups, and get them back via .group and .groups" do
    group = stub(:name => :foo)
    subject.add_group(group)
    subject.groups.should have(1).group
    subject.groups.first.should == group
    subject.group(:foo).should == group
  end

  describe ".add_field_to_default_group" do
    it "creates a group named :main and adds the field to it" do
      field = stub
      group = stub
      group.expects(:add_field).with(field)
      Railsyard::Config::EditGroup.expects(:new).with(:main).returns(group)
      subject.add_field_to_default_group(field)
      subject.group(:main).should == group
    end
  end

end
