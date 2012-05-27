require 'rails/generators'

module Railsyard
  module Generators

    class EditorGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      argument :model_attributes, type: :array, default: [], banner: "[field[:type][:index] field[:type][:index]]"
      desc "Generates a model with given NAME and attributes and creates the Railsyard editor file"

      # hook_for :orm, :as => "model"
      hook_for :test_framework, :as => :helper

      def initialize(*args, &block)
        super
        @class_name = class_name
        @attributes = []

        model_attributes.collect! do |attribute|
          args = attribute.split(":")
          name = args[0]
          type = args[1]
          index = args[2]

          custom_type = Railsyard::Backend.plugin_manager.plugins.collect { |p| p.generator_editor_type(type) }.compact.first
          if custom_type
            type = custom_type[:ar_type]
            attr_options = {editor: "field :#{name}, #{custom_type[:editor_options]}"}
          else
            attr_options = {editor: "field :#{name}"}
          end
          @attributes << Rails::Generators::GeneratedAttribute.new(name, type, index, attr_options)
          [name, type, index].join ':'
        end

        invoke "active_record:model", [name, model_attributes], :migration => true
      end

      def create_editor
        template "editor_for_resource.rb.erb", "app/backend/editor_for_#{singular_name}.rb"
      end

    end

  end
end
