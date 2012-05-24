require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/dashboard'

module Railsyard::Backend
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
