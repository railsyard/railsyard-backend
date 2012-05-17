require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/edit_field'

module Railsyard::Backend
  module Config

    class EditField < Base
      block_attr_accessor :visible
      block_attr_accessor :input_options

      attr_reader :name, :field_type

      def initialize(name, options = {}, &block)
        @name = name.to_sym
        options.symbolize_keys!
        options.assert_valid_keys(:as)
        @field_type = options[:as].to_sym if options[:as].present?
        @visible = true
        @input_options = {}
        Blockenspiel.invoke(block, Dsl::EditField.new(self)) if block_given?
      end

    end

  end
end
