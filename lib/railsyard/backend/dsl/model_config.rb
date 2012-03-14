require 'blockenspiel'
require 'railsyard/backend/dsl/edit_config'
require 'railsyard/backend/dsl/list_config'

module Railsyard
  module Backend
    module Dsl

      class ModelConfig
        include Blockenspiel::DSL
        attr_reader :model_class, :edit_config, :list_config

        def initialize(model_class, &block)
          Blockenspiel.invoke(block, self) if block_given?
        end

        def edit(&block)
          @edit_config ||= EditConfig.new(&block)
        end

        def list(&block)
          @list_config ||= ListConfig.new(&block)
        end

      end
    end
  end
end
