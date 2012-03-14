require 'blockenspiel'
require 'railsyard/backend/dsl/group_config'

module Railsyard
  module Backend
    module Dsl

      class EditConfig
        include Blockenspiel::DSL

        def initialize(&block)
          @group_configs = {}
          Blockenspiel.invoke(block, self) if block_given?
        end

        def group(name, &block)
          @group_configs[name.to_sym] = GroupConfig.new(name, &block)
        end

        def group_config_by_name(name)
          @group_configs[name.to_sym]
        end

        def group_configs
          @group_configs.values
        end

        def field(*args, &block)
          @group_configs[:default] ||= GroupConfig.new(:default)
          @group_configs[:default].field(*args, &block)
        end

      end

    end
  end
end
