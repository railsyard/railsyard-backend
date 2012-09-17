require 'blockenspiel'
require 'railsyard/config/base'
require 'railsyard/dsl/list_field'

module Railsyard
  module Config

    class ListField < Base
      attr_accessor :formatter
      attr_reader :name

      def initialize(name, &block)
        @name = name.to_sym
        Blockenspiel.invoke(block, Dsl::ListField.new(self)) if block_given?
      end

      def format(value, default)
        if formatter.present?
          formatter.call(value)
        else
          value.blank? ? default : value.to_s
        end
      end

    end

  end
end
