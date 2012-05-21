require 'spec_helper'

describe "Sidebar DSL" do
  
  it "saves the whole DSL configuration tree properly" do
    
    class Foo; end
    class Bar; end

    config = Railsyard::Backend::Config::Sidebar.new do
      group :foobar do
        resource Foo
        instance Bar
      end
    end

    config.groups.should have(1).group
    config.group(:foobar).should be_present

    group = config.group(:foobar)
    group.items.should have(2).items
    group.item(Foo).should be_present

    foo_resource = group.item(Foo)
    foo_resource.model_class.should == Foo
    foo_resource.type.should == :resource
  end

end

