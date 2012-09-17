require 'spec_helper'

describe Railsyard::Config::List do

  it "lets you add fields, and get them back via .field and .fields" do
    field = stub(:name => :foo)
    subject.add_field(field)
    subject.fields.should have(1).field
    subject.fields.first.should == field
    subject.field(:foo).should == field
  end


  %w(sorting_attribute page_size search_scope).each do |attr|
    it "let get and set :#{attr} attribute" do
      subject.send("#{attr}=", :foo)
      subject.send(attr).should == :foo
    end
  end

  describe ".view_mode" do
    it "has a default simple view mode" do
      subject.view_mode.should be_simple
    end
    it "can be changed with view_mode =" do
      subject.view_mode = :tree
      subject.view_mode.should be_tree
    end
  end

  it "has a default page size of 25" do
    subject.page_size.should == 25
  end

end
