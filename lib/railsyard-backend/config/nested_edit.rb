require 'railsyard-backend/config/edit'

module Railsyard::Backend
  module Config

    class NestedEdit < Edit

      attr_reader :options, :name

      def initialize(name, options = {}, &block)
        @options = options
        @name = name
        super(&block)
      end

    end

  end
end
