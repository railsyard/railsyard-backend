require 'spec_helper'

describe Railsyard::Backend::Base do

  describe ".define_editor_for" do
    let(:model) { stub }
    let(:model_config) { stub }

    it "setup a Dsl::ModelConfig for the specified model" do
      Railsyard::Backend::Dsl::ModelConfig.expects(:new).with(@model)
      subject.define_editor_for @model
    end

    it ".config_for_model returns it" do
      Railsyard::Backend::Dsl::ModelConfig.stubs(:new).with(@model).returns(model_config)
      subject.define_editor_for @model
      subject.config_for_model(@model).should == model_config
    end
  end

  context "integration" do
    it "saves all the DSL tree configuration properly" do

      backend = Railsyard::Backend::Base.new
      backend.define_editor_for "foo" do
        localized with: :lang
        edit do
          field :field_in_default_group
          group :foo do
            field :simple
            field :explicit_type, as: :string
            field :advanced do
              read_only true
              visible true
              use_partial "foo_bar"
            end
          end
        end
      end

      config = backend.config_for_model("foo")
      config.should be_localized

      edit_config = config.edit_config

      default_group = edit_config.group_config_by_name(:default)
      default_group.field_config_by_name(:field_in_default_group).should_not be_nil

      foo_group = edit_config.group_config_by_name(:foo)
      foo_group.field_config_by_name(:simple).should_not be_nil
      foo_group.field_config_by_name(:explicit_type).field_type.should == :string

      advanced_field = foo_group.field_config_by_name(:advanced)
      advanced_field.read_only_config.should be_true
      advanced_field.visible_config.should be_true
      advanced_field.partial_config.should == "foo_bar"
    end

  end

end

