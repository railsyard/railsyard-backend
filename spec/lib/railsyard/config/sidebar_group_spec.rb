require 'spec_helper'

describe Railsyard::Backend::Config::SidebarGroup do

  subject { Railsyard::Backend::Config::SidebarGroup.new(:lol) }

  it "takes a name" do
    subject.name.                        should     == :lol
  end

  it "lets you add items of any type, and get them back via .item and .items" do
    item1 = stub( name: :lmao, type: :rofl )
    item2 = stub( name: :foo,  type: :bar )
    subject.add_item( item1 )
    subject.add_item( item2 )
    subject.items.                       should     have( 2 ).items
    subject.items.first.                 should     == item1
    subject.item( :lmao ).               should     == item1
  end

end
