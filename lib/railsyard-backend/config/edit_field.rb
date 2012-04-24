require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/edit_field'

module Railsyard::Backend
  module Config

    class EditField < Base
      conditional_config :readonly
      conditional_config :partial
      conditional_config :visible

      attr_accessor :input_options

      attr_reader :name, :field_type

      def initialize(name, options = {}, &block)
        @name = name.to_sym
        options.symbolize_keys!
        options.assert_valid_keys(:as)
        @field_type = options[:as].to_sym if options[:as].present?
        Blockenspiel.invoke(block, Dsl::EditField.new(self)) if block_given?
      end

      def simple_form_options
        options = @input_options || {}
        options = options.dup.merge(as: @field_type) if @field_type.present?
        options
      end
    end

  end
end
