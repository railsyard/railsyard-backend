require 'spec_helper'

describe Railsyard::Config::ListField do

  subject { Railsyard::Config::ListField.new(:foo) }

  it "takes a name" do
    subject.name.should == :foo
  end

  %w(formatter).each do |attr|
    it "let get and set conditional :#{attr} attribute" do
      subject.send("#{attr}=", :foo)
      subject.send(attr).should == :foo
    end
  end

  describe ".format" do

    it "returns the passed argument as string, if there's no formatter" do
      subject.format(:foo, "No value").should == "foo"
    end

    it "returns the default label, if there's also a blank value" do
      subject.format("", "No value").should == "No value"
    end

    it "returns the formatted argument, otherwise" do
      subject.stubs(:formatter).returns(Proc.new { |val| val.to_s.upcase })
      subject.format(:foo, "No value").should == "FOO"
    end
  end

end

