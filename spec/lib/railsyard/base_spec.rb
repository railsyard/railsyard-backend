require 'spec_helper'

describe Railsyard::Backend::EditorManager do

  describe ".define_editor_for" do
    let(:model) { stub }
    let(:model_config) { stub }

    it "setup a Config::Model for the specified model" do
      model = stub(name: :class_name)
      Railsyard::Backend::Config::Model.expects(:new).with(model)
      subject.define_editor_for(model)
    end

  end

  describe ".editor_for" do
    it "returns an editor by model" do
      model = stub(name: :class_name)
      model_config = stub
      Railsyard::Backend::Config::Model.stubs(:new).returns(model_config)
      subject.define_editor_for(model)
      subject.editor_for(model).should == model_config
    end
  end

  context "integration" do

    it "saves all the DSL tree configuration properly" do

      class Foobar; end

      backend = Railsyard::Backend::EditorManager.new
      backend.define_editor_for Foobar do

        label :title
        localized with: :lang

        edit do
          field :field_in_default_group
          group :custom_group do
            field :simple
            field :explicit_type, as: :string
            field :advanced do
              readonly { :foo }
              visible if: lambda { :bar }
              use_partial :foo_bar
            end
            nested :relation do
              field :title
              nested :deep_relation do
                field :title
              end
            end
          end
        end

        list do
          as_tree using: :parent
          field :title do
            format_as { |value| value.to_s.upcase }
          end
          field :author do
            use_partial { |value| "author" }
          end
          field :updated_at do
            date_format :short
          end
          field :created_at do
            visible if: lambda { true }
          end
        end

      end

      config = backend.editor_for(Foobar)

      config.l10n_attribute.should == :lang
      config.label_method.should == :title

      config.list.sorting_type.should == :tree
      config.list.sorting_attribute.should == :parent
      config.list.field(:title).format.call(:test).should == "TEST"
      config.list.field(:updated_at).date_format.should == :short
      config.list.field(:created_at).visible[:if].call.should be_true

      config.edit.group(:main).field(:field_in_default_group).should_not be_nil

      group = config.edit.group(:custom_group)
      group.field(:simple).should_not be_nil
      group.field(:relation).group(:main).should have(2).fields
      group.field(:explicit_type).field_type.should == :string

      advanced_field = group.field(:advanced)
      advanced_field.readonly.call.should == :foo
      advanced_field.visible[:if].call.should == :bar
      advanced_field.partial.should == :foo_bar
    end

  end

end

