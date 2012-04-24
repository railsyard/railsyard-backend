require 'blockenspiel'
require 'railsyard-backend/config/base'

module Railsyard::Backend
  module Config

    class ListField < Base
      attr_accessor :format, :date_format, :partial
      conditional_config :visible
      attr_reader :name

      def initialize(name, &block)
        @name = name.to_sym
        Blockenspiel.invoke(block, Dsl::ListField.new(self)) if block_given?
      end
    end

  end
end
