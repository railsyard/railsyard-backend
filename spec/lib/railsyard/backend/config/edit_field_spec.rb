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

  %w(input_options readonly partial visible).each do |attr|
    it "let get and set conditional :#{attr} attribute" do
      subject.send("#{attr}=", :foo)
      subject.send(attr).should == :foo
    end
  end

  describe "simple_form_options" do
    it "merges :input_options and :as params" do
      config = Railsyard::Backend::Config::EditField.new(:field, as: :type)
      config.input_options = { foo: :bar }
      config.simple_form_options.should == { as: :type, foo: :bar }
    end

    it "supports nils" do
      config = Railsyard::Backend::Config::EditField.new(:field, as: :type)
      config.simple_form_options.should == { as: :type }
    end
  end

end

