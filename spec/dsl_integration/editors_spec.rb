require 'spec_helper'

describe "Editors DSL" do

  it "saves all the DSL tree configuration properly" do

    class Foobar; end

    backend = Railsyard::Backend::EditorManager.new
    backend.define_editor_for Foobar do

      label :title
      image :thumb

      edit do
        field :field_in_default_group
        group :custom_group do
          field :simple
          field :explicit_type, as: :string
          field :advanced do
            visible -> { :bar }
            input_options :foo_bar
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
        sortable using: :position
        field :title do
          format_as { |value| value.to_s.upcase }
        end
        field :created_at
      end

    end

    config = backend.editor_for(Foobar)

    config.label_method.should == :title
    config.image_method.should == :thumb

    config.list.sorting_type.should == :simple
    config.list.sorting_attribute.should == :position
    config.list.field(:title).formatter.call(:test).should == "TEST"
    config.list.field(:created_at).should be_present

    config.edit.group(:main).field(:field_in_default_group).should_not be_nil

    group = config.edit.group(:custom_group)
    group.field(:simple).should_not be_nil
    group.field(:relation).group(:main).should have(2).fields
    group.field(:explicit_type).field_type.should == :string

    advanced_field = group.field(:advanced)
    advanced_field.visible.call.should == :bar
    advanced_field.input_options.should == :foo_bar
  end

end

