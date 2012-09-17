require 'spec_helper'

describe Railsyard::Dsl::Edit do

  let(:config) { stub }
  subject { Railsyard::Dsl::Edit.new(config) }

  describe ".group" do
    it "initialize a Config::EditGroup and adds it to config" do
      group_config = stub
      Railsyard::Config::EditGroup.stubs(:new).with(:foo).returns(group_config)
      config.expects(:add_group).with(group_config)
      subject.group(:foo)
    end
  end

  describe ".field" do
    it "initialize a Config::EditField and adds it to default group" do
      field_config = stub
      Railsyard::Config::EditField.stubs(:new).with(:foo, { cheese: "bar" }).returns(field_config)
      config.expects(:add_field_to_default_group).with(field_config)
      subject.field(:foo, cheese: "bar")
    end
  end

  describe ".nested" do
    it "initialize a Config::NestedEdit and adds it to default group" do
      field_config = stub
      Railsyard::Config::NestedEdit.stubs(:new).with(:foo, { cheese: "bar" }).returns(field_config)
      config.expects(:add_nested_to_default_group).with(field_config)
      subject.nested(:foo, cheese: "bar")
    end
  end

end
