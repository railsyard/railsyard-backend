require 'spec_helper'

describe Railsyard::Dsl::Model do

  let(:config) { stub }
  subject { Railsyard::Dsl::Model.new(config) }

  describe ".edit" do
    it "initialize a Config::Edit and assign to config" do
      config_edit = stub
      Railsyard::Config::Edit.expects(:new).returns(config_edit)
      config.expects(:edit=).with(config_edit)
      subject.edit
    end
  end

  describe ".list" do
    it "initialize a Config::List and assign to config" do
      config_list = stub
      Railsyard::Config::List.expects(:new).returns(config_list)
      config.expects(:list=).with(config_list)
      subject.list
    end
  end

  describe ".exportable_as" do
    it "adds the specified formats to config" do
      config.expects(:add_export_format).with(:foo)
      config.expects(:add_export_format).with(:bar)
      subject.exportable_as(:foo, :bar)
    end
  end

end
