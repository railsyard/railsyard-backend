require 'spec_helper'

describe Railsyard::Backend::Config::Dashboard do

  it "lets you add rows of any type, and get them back via .group and .rows" do
    group1 = stub(name: :foo)
    group2 = stub(name: :bar)
    subject.add_row(group1)
    subject.add_row(group2)
    subject.rows.should have(2).widgets
    subject.rows.should == [ group1, group2 ]
    subject.group(:bar).should == group2
  end

end
