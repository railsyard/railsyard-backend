require 'spec_helper'
require 'railsyard/backend/dsl/utils'

describe Railsyard::Backend::Dsl::Utils do

  before do
    class TestClass
      include Railsyard::Backend::Dsl::Utils
      conditional_dls_method :foo, :foo_config
      attr_reader :foo_config
    end
  end

  subject { TestClass.new }

  describe "#conditional_dls_method" do
    it "accepts boolean" do
      subject.foo(true)
      subject.foo_config.should be_true
    end
    it "accepts :if option with a callable object" do
      subject.foo(if: lambda {})
      subject.foo_config[:if].should_not be_nil
    end
    it "accepts :unless option with a callable object" do
      subject.foo(unless: Proc.new {})
      subject.foo_config[:unless].should_not be_nil
    end
    it "raises an Exception with other options" do
      lambda { subject.foo(foo: true) }.should raise_error
      lambda { subject.foo(if: true) }.should raise_error
    end
    it "accepts block" do
      subject.foo { true }
      subject.foo_config.should be_a Proc
    end
  end

end
