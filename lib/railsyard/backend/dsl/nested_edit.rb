require 'blockenspiel'
require 'railsyard/backend/dsl/base'
require 'railsyard/backend/config/edit_group'
require 'railsyard/backend/config/edit_field'

module Railsyard
  module Backend
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
end
