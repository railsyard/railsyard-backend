require 'spec_helper'

describe Railsyard::Backend::Config::SidebarGroup do

  subject { Railsyard::Backend::Config::SidebarGroup.new(:lol) }

  it "takes a name" do
    subject.name.should == :lol
  end

  it "lets you add items of any type, and get them back via .item and .items" do
    model = stub(name: "Foo")
    item = stub(model_class: model, type: :instance)
    subject.add_item(item)
    subject.items.should have(1).item
    subject.items.first.should == item
    subject.item(model).should == item
  end

end
