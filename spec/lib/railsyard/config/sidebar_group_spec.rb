require 'spec_helper'

describe Railsyard::Config::SidebarGroup do

  subject { Railsyard::Config::SidebarGroup.new(:lol) }

  it "takes a name" do
    subject.name.should == :lol
  end

  it "lets you add items of any type, and get them back via .items" do
    item = stub(type: :instance, name: "Foo")
    subject.add_item(item)
    subject.items.should have(1).item
    subject.items.first.should == item
  end

end
