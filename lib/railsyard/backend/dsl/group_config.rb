require 'blockenspiel'

module Railsyard
  module Backend
    module Dsl

      class GroupConfig
        include Blockenspiel::DSL
        attr_reader :name

        def initialize(name, &block)
          @field_configs = {}
          @name = name.to_sym
          Blockenspiel.invoke(block, self) if block_given?
        end

        def field(name, options={}, &block)
          @field_configs[name.to_sym] = FieldConfig.new(name, options, &block)
        end

        def field_configs
          @field_configs.values
        end

        def field_config_by_name(name)
          @field_configs[name.to_sym]
        end

      end

    end
  end
end
