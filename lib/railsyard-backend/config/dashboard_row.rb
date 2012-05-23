require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/dashboard_row'

module Railsyard::Backend
  module Config

    class DashboardRow < Base
      attr_reader :name

      def initialize(name, &block)
        @name = name.to_sym
        @widgets = {}
        Blockenspiel.invoke(block, Dsl::DashboardRow.new(self)) if block_given?
      end

      def add_widget(widget_config)
        @widgets[widget_config.model_class.name] = widget_config
      end

      def widget(model_class)
        @widgets[model_class.name]
      end

      def widgets
        @widgets.values
      end

    end

  end
end
