require 'spec_helper'

describe Railsyard::Backend::Config::SidebarLink do

  subject { Railsyard::Backend::Config::SidebarLink.new(:link,
                                                        "Railsyard",
                                                        "http://railsyardcms.org",
                                                        {target: "_blank"}) }

  it "takes a type" do
    subject.type.should == :link
  end

  it "takes a link name" do
    subject.name.should == "Railsyard"
  end

  it "takes a link url" do
    subject.url.should == "http://railsyardcms.org"
  end

  it "takes an optional hash of html options" do
    subject.html_options.should == {target: "_blank"}
  end

end
