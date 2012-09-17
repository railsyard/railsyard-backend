require 'spec_helper'

describe Railsyard::Config::Sidebar do

  it "lets you add groups of any type, and get them back via .groups" do
    group1 = stub(name: :foo)
    group2 = stub()
    subject.add_group(group1)
    subject.add_group(group2)
    subject.groups.should have(2).items
    subject.groups.should == [ group1, group2 ]
    subject.groups.last.should == group2
  end

end
