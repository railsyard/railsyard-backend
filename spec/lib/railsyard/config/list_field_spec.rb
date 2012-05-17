require 'spec_helper'

describe Railsyard::Backend::Config::ListField do

  subject { Railsyard::Backend::Config::ListField.new(:foo) }

  it "takes a name" do
    subject.name.should == :foo
  end

  %w(format).each do |attr|
    it "let get and set conditional :#{attr} attribute" do
      subject.send("#{attr}=", :foo)
      subject.send(attr).should == :foo
    end
  end

end

