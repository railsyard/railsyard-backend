require 'spec_helper'

describe "Sidebar DSL" do

  it "saves the whole DSL configuration tree properly" do

    class Foo; end
    class Bar; end

    config = Railsyard::Backend::Config::Sidebar.new do
      group :foobar do
        resource Foo
        instance Bar
        link "Railsyard", "http://railsyardcms.org", target: "_blank"
      end
    end

    config.groups.should have(1).group
    config.group(:foobar).should be_present

    group = config.group(:foobar)
    group.items.should have(3).items
    group.items.first.should be_present

    foo_resource = group.items.first
    foo_resource.model_class.should == Foo
    foo_resource.type.should == :resource

    blog_link = group.items.last
    blog_link.type.should == :link
    blog_link.name.should == "Railsyard"
    blog_link.url.should == "http://railsyardcms.org"
    blog_link.html_options.should == {target: "_blank"}
  end

end
