require 'railsyard/config/edit'

module Railsyard
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
