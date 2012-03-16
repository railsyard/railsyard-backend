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
          @model_class = model_class
          Blockenspiel.invoke(block, self) if block_given?
        end

        def edit(&block)
          @edit_config ||= EditConfig.new(&block)
        end

        def list(&block)
          @list_config ||= ListConfig.new(&block)
        end

        def localized(options)
          options.symbolize_keys!
          options.assert_valid_keys(:with)
          @l10n_config = options
        end

        def localized?
          !!@l10n_config
        end

        def l10n_field
          @l10n_config[:with].to_sym if localized?
        end

      end
    end
  end
end
