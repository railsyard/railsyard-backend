module Railsyard
  module Generators

    class EditorGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
      source_root File.expand_path('../templates', __FILE__)

      argument :model_attributes, type: :array, default: [], banner: "[field[:type][:index] field[:type][:index]]"
      desc "Generates a model with given NAME and attributes and creates the Railsyard editor configuration"

      hook_for :orm

      def initialize(*args, &block)
        super
        @attributes = []
        model_attributes.each do |attribute|
          @attributes << Rails::Generators::GeneratedAttribute.new(*attribute.split(":")) if attribute.include?(":")
        end
      end

      def create_editor
        template "editor_for_resource.rb", "app/backend/editor_for_#{singular_name}.rb"
      end

    end

  end
end
