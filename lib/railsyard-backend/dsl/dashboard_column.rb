require 'blockenspiel'

module Railsyard::Backend
  module Dsl

    class DashboardColumn < Base

      def widget(type, name=nil, &block)
        require 'railsyard-backend/config/dashboard_widget'
        config.add_widget Config::DashboardWidget.new(type, name || type, &block)
      end

    end

  end
end
