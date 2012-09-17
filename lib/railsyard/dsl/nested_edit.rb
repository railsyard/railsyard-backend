require 'blockenspiel'
require 'railsyard/dsl/base'
require 'railsyard/config/edit_group'
require 'railsyard/config/edit_field'

module Railsyard
  module Dsl

    class NestedEdit < Edit
      def group(name, &block)
        config.add_group Config::EditGroup.new(name, &block)
      end

      def field(name, options = {}, &block)
        config.add_field_to_default_group Config::EditField.new(name, options, &block)
      end

      def nested(name, options = {})
        config.add_nested_to_default_group Config::NestedEdit.new(name, options, &block)
      end
    end

  end
end
