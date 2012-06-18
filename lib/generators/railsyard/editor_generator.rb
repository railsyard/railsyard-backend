require 'rails/generators'
require 'generators/railsyard/orm_helpers'

module Railsyard
  module Generators

    class EditorGenerator < Rails::Generators::NamedBase
      include Railsyard::Generators::OrmHelpers

      source_root File.expand_path('../templates', __FILE__)
      argument :model_attributes, type: :array, default: [], banner: "[field[:type][:index] field[:type][:index]]"
      desc "Generates a model with given NAME and attributes and creates the Railsyard editor file"

      hook_for :test_framework, :as => :model

      def initialize(*args, &block)
        super
        @class_name = class_name
        @fields = []
        @attributes = []
        @model_config = ""

        model_attributes.each do |attribute|
          args = attribute.split(":")
          name = args[0]
          type = args[1]
          index = args[2]

          custom_type = Railsyard::Backend.plugin_manager.generator_editor_type(type)
          if custom_type
            custom_type.fields(name: name).each do |field|
              @attributes << [field[:name], field[:type], index].join(':')
            end
            @fields << {name: custom_type.name, editor_config: custom_type.editor_config(name: name)}
            @model_config << custom_type.model_config(name: name) << "\n" if custom_type.model_config
          else
            @fields << {name: name, editor_config: "field :#{name}"}
            @attributes << [name, type, index].join(':')
          end
        end
      end

      def create_orm_files
        invoke "active_record:model", [@class_name, @attributes], :migration => true unless model_exists?
      end

      def inject_railsyard_plugin_content
        class_path = class_name.to_s.split("::")

        indent_depth = class_path.size - 1
        content = @model_config.split("\n").map { |line| "  " * indent_depth + line } .join("\n") << "\n"

        inject_into_class(model_path, class_path.last, content) if model_exists?
      end

      def create_editor
        template "editor_for_resource.rb.erb", "app/backend/editor_for_#{singular_name}.rb" unless editor_exists?
      end

    end

  end
end
