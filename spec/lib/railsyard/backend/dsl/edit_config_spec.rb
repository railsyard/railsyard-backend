require 'spec_helper'

describe Railsyard::Backend::Dsl::EditConfig do

  describe ".group" do
    it "takes a group name and returns a Dsl::GroupConfig" do
      group_config = stub
      Railsyard::Backend::Dsl::GroupConfig.stubs(:new).with(:foo).returns(group_config)
      subject.group(:foo)
      subject.group_configs.first.should == group_config
      subject.group_config_by_name(:foo).should == group_config
    end
  end

  describe ".field" do
    it "adds a :default Group and forwards the call to it" do
      default_group_config = stub
      default_group_config.expects(:field).with(:test)
      Railsyard::Backend::Dsl::GroupConfig.stubs(:new).with(:default).returns(default_group_config)
      subject.field(:test)
      subject.group_config_by_name(:default).should == default_group_config
    end
  end

end
