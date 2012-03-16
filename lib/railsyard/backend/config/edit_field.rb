require 'blockenspiel'
require 'railsyard/backend/config/base'

module Railsyard
  module Backend
    module Config

      class EditField < Base
        conditional_config :read_only
        conditional_config :partial
        conditional_config :visible

        attr_reader :name, :field_type

        def initialize(name, options = {}, &block)
          @name = name.to_sym
          options.symbolize_keys!
          options.assert_valid_keys(:as)
          @field_type = options[:as].to_sym if options[:as].present?
          Blockenspiel.invoke(block, Dsl::EditField.new(self)) if block_given?
        end

      end

    end
  end
end
