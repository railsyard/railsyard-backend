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

  describe ".localized" do
    it "accepts :with option and assigns it to config :l10n_attribute" do
      config_edit = stub
      config.expects(:l10n_attribute=).with(:param)
      subject.localized(with: :param)
    end
    it "throws an Exception with other options" do
      lambda { subject.localized(foo: :bar) }.should raise_error
    end
  end

end
