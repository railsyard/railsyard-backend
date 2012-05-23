require 'blockenspiel'
require 'railsyard-backend/dsl/sidebar'
require 'railsyard-backend/config/base'
require 'railsyard-backend/config/dashboard_row'

module Railsyard::Backend
  module Config

    class Dashboard < Base

      def initialize(&block)
        @rows = {}
        Blockenspiel.invoke(block, Dsl::Dashboard.new(self)) if block_given?
      end

      def add_row(group_config)
        @rows[group_config.name] = group_config
      end

      def rows
        @rows.values
      end

      def group(name)
        @rows[name.to_sym]
      end

    end

  end
end
