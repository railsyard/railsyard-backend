require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/edit_field'

module Railsyard::Backend
  module Config

    class EditField < Base
      attr_accessor :visible
      attr_accessor :input_options
      attr_accessor :name
      attr_accessor :field_type

      def initialize(name, options = {}, &block)
        @name = name.to_sym
        options.symbolize_keys!
        options.assert_valid_keys(:as)
        @field_type = options[:as].to_sym if options[:as].present?
        @visible = true
        @input_options = {}
        Blockenspiel.invoke(block, Dsl::EditField.new(self)) if block_given?
      end

      def is_visible_for_resource?(resource, view)
        value_or_call(visible, resource, view)
      end

      def simple_form_options(resource, view)
        options = {}
        options[:as] = field_type if field_type.present?
        options.merge value_or_call(input_options, resource, view)
      end

    end

  end
end
