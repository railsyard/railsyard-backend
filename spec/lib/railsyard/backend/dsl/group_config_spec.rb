require 'spec_helper'

describe Railsyard::Backend::Dsl::GroupConfig do

  subject { Railsyard::Backend::Dsl::GroupConfig.new(:foo) }

  it "takes a name" do
    subject.name.should == :foo
  end

  describe ".field" do
    it "returns a Dsl::FieldConfig" do
      field_config = stub
      Railsyard::Backend::Dsl::FieldConfig.stubs(:new).with(:bar, option: 1).returns(field_config)
      subject.field(:bar, option: 1)
      subject.field_configs.first.should == field_config
      subject.field_config_by_name(:bar).should == field_config
    end
  end

end
