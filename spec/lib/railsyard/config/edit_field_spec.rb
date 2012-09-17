require 'spec_helper'

describe Railsyard::Config::EditField do

  subject { Railsyard::Config::EditField.new(:foo) }

  it "takes a name" do
    subject.name.should == :foo
  end

  it "accepts an :as parameter" do
    config = Railsyard::Config::EditField.new(:foo, as: :foo)
    config.field_type.should == :foo
  end

  %w(input_options visible).each do |attr|
    it "let get and set conditional :#{attr} attribute" do
      subject.send("#{attr}=", :foo)
      subject.send(attr).should == :foo
    end
  end

  describe ".is_visible_for_resource?" do

    context "if .visible is a callable object" do
      it "calls it passing it resource and view context, and returns the result" do
        config = Railsyard::Config::EditField.new(:foo)
        config.stubs(:visible).returns(Proc.new { |a, b| a + b })
        config.is_visible_for_resource?("foo", "bar").should == "foobar"
      end
    end

    context "otherwise" do
      it "just returns the value" do
        config = Railsyard::Config::EditField.new(:foo)
        config.stubs(:visible).returns(:foo)
        config.is_visible_for_resource?(stub, stub).should == :foo
      end
    end

  end

  describe ".simple_form_options" do

    it "passes the .field_type as :as key" do
      config = Railsyard::Config::EditField.new(:field, as: :type)
      config.simple_form_options(stub, stub).should == { as: :type }
    end

    it "merges .field_type with .input_options (if it's not callable)" do
      config = Railsyard::Config::EditField.new(:field, as: :type)
      config.input_options = { foo: :bar }
      config.simple_form_options(stub, stub).should == { as: :type, foo: :bar }
    end

    it "merges .field_type with the result of calling .input_options (if it's callable)" do
      config = Railsyard::Config::EditField.new(:field, as: :type)
      config.input_options = Proc.new { { bar: :foo } }
      config.simple_form_options(stub, stub).should == { as: :type, bar: :foo }
    end

  end

end

