require 'spec_helper'
require 'railsyard/backend/dsl/field_config'

describe Railsyard::Backend::Dsl::FieldConfig do

  subject { Railsyard::Backend::Dsl::FieldConfig.new(:foo) }

  it "takes a name" do
    subject.name.should == :foo
  end

  it "accepts an :as parameter" do
    config = Railsyard::Backend::Dsl::FieldConfig.new(:foo, as: :test)
    config.field_type.should == :test
  end

  describe ".read_only" do
    it "sets conditional :read_only_config attribute" do
      subject.read_only(true)
      subject.read_only_config.should be_true
    end
  end

  describe ".use_partial" do
    it "sets conditional :partial_config attribute" do
      subject.use_partial("foo")
      subject.partial_config.should == "foo"
    end
  end

  describe ".visible" do
    it "sets conditional :visible_config attribute" do
      subject.visible(true)
      subject.visible_config.should be_true
    end
  end

end

