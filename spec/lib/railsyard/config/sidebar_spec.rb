require 'spec_helper'

describe Railsyard::Backend::Config::Sidebar do

  it "lets you add groups of any type, and get them back via .group and .groups" do
    group1 = stub(name: :foo)
    group2 = stub(name: :bar)
    subject.add_group(group1)
    subject.add_group(group2)
    subject.groups.should have(2).items
    subject.groups.should == [ group1, group2 ]
    subject.group(:bar).should == group2
  end

end
