require 'blockenspiel'

module Railsyard::Backend
  module Dsl

    class DashboardRow < Base

      def resource(*args, &block)
        require 'railsyard-backend/config/sidebar_widget'
        config.add_widget Config::DashboardWidget.new(:resource, *args, &block)
      end

      def instance(*args, &block)
        require 'railsyard-backend/config/sidebar_widget'
        config.add_widget Config::DashboardWidget.new(:instance, *args, &block)
      end

    end

  end
end
