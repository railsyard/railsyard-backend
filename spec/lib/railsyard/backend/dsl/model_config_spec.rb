require 'spec_helper'

describe Railsyard::Backend::Dsl::ModelConfig do

  let(:model) { stub }
  subject { Railsyard::Backend::Dsl::ModelConfig.new(model) }

  it "takes a model class" do
    subject.model_class.should == model
  end

  it "saves localized_with config" do
    subject.localized(with: :foo)
    subject.should be_localized
    subject.l10n_field.should == :foo
  end

  describe ".edit" do
    it "initialize a Dsl::EditConfig" do
      edit_config = stub
      Railsyard::Backend::Dsl::EditConfig.stubs(:new).returns(edit_config)
      subject.edit_config.should be_nil
      subject.edit
      subject.edit_config.should == edit_config
    end
  end

  describe ".list" do
    it "initialize a Dsl::ListConfig" do
      list_config = stub
      Railsyard::Backend::Dsl::ListConfig.stubs(:new).returns(list_config)
      subject.list_config.should be_nil
      subject.list
      subject.list_config.should == list_config
    end
  end


end
