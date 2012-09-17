require 'blockenspiel'
require 'railsyard/config/base'
require 'railsyard/dsl/dashboard'

module Railsyard
  module Config

    class Dashboard < Base

      def initialize(&block)
        @columns = []
        Blockenspiel.invoke(block, Dsl::Dashboard.new(self)) if block_given?
      end

      def add_column(column_config)
        @columns << column_config
      end

      def columns
        @columns
      end

    end

  end
end
