require 'blockenspiel'
require 'railsyard-backend/dsl/edit_group'
require 'railsyard-backend/config/base'

module Railsyard::Backend
  module Config

    class EditGroup < Base
      attr_reader :name

      def initialize(name, &block)
        @fields = {}
        @name = name.to_sym
        Blockenspiel.invoke(block, Dsl::EditGroup.new(self)) if block_given?
      end

      def add_field(field_config)
        @fields[field_config.name] = field_config
      end

      def add_nested(nested_config)
        @fields[nested_config.name] = nested_config
      end

      def field(name)
        @fields[name.to_sym]
      end

      def fields
        @fields.values
      end

      def render(form, context)
        form.group name do
          fields.map do |field|
            field.render(form, context)
          end.join.html_safe
        end
      end
    end

  end
end
