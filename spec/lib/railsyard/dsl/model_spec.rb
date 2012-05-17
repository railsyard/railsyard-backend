require 'spec_helper'

describe Railsyard::Backend::Dsl::Model do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::Model.new(config) }

  describe ".edit" do
    it "initialize a Config::Edit and assign to config" do
      config_edit = stub
      Railsyard::Backend::Config::Edit.expects(:new).returns(config_edit)
      config.expects(:edit=).with(config_edit)
      subject.edit
    end
  end

  describe ".list" do
    it "initialize a Config::List and assign to config" do
      config_list = stub
      Railsyard::Backend::Config::List.expects(:new).returns(config_list)
      config.expects(:list=).with(config_list)
      subject.list
    end
  end

end
