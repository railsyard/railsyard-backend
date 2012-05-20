require 'spec_helper'

describe Railsyard::Backend::Config::SidebarItem do

  subject { Railsyard::Backend::Config::SidebarItem.new( :foo, :bar ) }

  it "takes a name" do
    subject.name.                        should     == :bar
  end

  it "takes a type" do
    subject.type.                        should     == :foo
  end

end
