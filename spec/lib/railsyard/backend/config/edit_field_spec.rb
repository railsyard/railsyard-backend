require 'spec_helper'

describe Railsyard::Backend::Config::EditField do

  subject { Railsyard::Backend::Config::EditField.new(:foo) }

  it "takes a name" do
    subject.name.should == :foo
  end

  it "accepts an :as parameter" do
    config = Railsyard::Backend::Config::EditField.new(:foo, as: :foo)
    config.field_type.should == :foo
  end

  %w(read_only partial visible).each do |attr|
    it "let get and set conditional :#{attr} attribute" do
      subject.send("#{attr}=", :foo)
      subject.send(attr).should == :foo
    end
  end

end

