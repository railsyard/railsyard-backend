require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/dashboard_column'

module Railsyard::Backend
  module Config

    class DashboardColumn < Base

      def initialize(&block)
        @widgets = []
        Blockenspiel.invoke(block, Dsl::DashboardColumn.new(self)) if block_given?
      end

      def add_widget(widget_config)
        @widgets << widget_config
      end

      def widgets
        @widgets
      end

    end

  end
end
