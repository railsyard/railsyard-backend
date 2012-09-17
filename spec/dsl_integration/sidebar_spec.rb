require 'spec_helper'

describe "Sidebar DSL" do

  it "saves the whole DSL configuration tree properly" do

    class Foo; end
    class Bar; end

    config = Railsyard::Config::Sidebar.new do
      group do
        resource Foo
        instance Bar
      end

      group :Links do
        link "Railsyard", "http://railsyardcms.org", target: "_blank"
      end
    end

    config.groups.should have(2).groups

    group = config.groups.first
    group.items.should have(2).items

    foo_resource = group.items.first
    foo_resource.model_class.should == Foo
    foo_resource.type.should == :resource

    group = config.groups.last
    blog_link = group.items.last
    blog_link.type.should == :link
    blog_link.name.should == "Railsyard"
    blog_link.url.should == "http://railsyardcms.org"
    blog_link.html_options.should == {target: "_blank"}
  end

end
