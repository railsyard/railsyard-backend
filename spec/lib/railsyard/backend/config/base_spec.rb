require 'spec_helper'

describe Railsyard::Backend::Config::Base do

  before do
    class FooClass < Railsyard::Backend::Config::Base
      conditional_config :foo
    end
  end

  subject { FooClass.new }

  describe "#conditional_config creates a config that" do
    it "accepts boolean" do
      subject.foo = true
      subject.foo.should be_true
    end
    it "accepts a callable object" do
      subject.foo = lambda { true }
      subject.foo.should respond_to :call
    end
    it "accepts :if option with a callable object" do
      subject.foo = { if: lambda {} }
      subject.foo[:if].should_not be_nil
    end
    it "accepts :unless option with a callable object" do
      subject.foo = { unless: Proc.new {} }
      subject.foo[:unless].should_not be_nil
    end
    it "raises an Exception with other options" do
      lambda { subject.foo = { foo: true } }.should raise_error
      lambda { subject.foo = { if:  true } }.should raise_error
    end
  end

end
