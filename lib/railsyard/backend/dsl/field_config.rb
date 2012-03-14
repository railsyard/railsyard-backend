require 'blockenspiel'
require 'railsyard/backend/dsl/utils'

module Railsyard
  module Backend
    module Dsl

      class FieldConfig
        include Blockenspiel::DSL
        include Utils

        conditional_dls_method :read_only,   :read_only_config
        conditional_dls_method :use_partial, :partial_config
        conditional_dls_method :visible,     :visible_config

        attr_reader :name, :field_type, :read_only_config, :partial_config, :visible_config

        def initialize(name, options = {}, &block)
          @name = name.to_sym
          options.symbolize_keys!
          options.assert_valid_keys(:as)
          @field_type = options[:as]
          Blockenspiel.invoke(block, self) if block_given?
        end

      end

    end
  end
end
