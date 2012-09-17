require 'blockenspiel'

module Railsyard
  module Dsl

    class DashboardColumn < Base

      def widget(type, name=nil, &block)
        require 'railsyard/config/dashboard_widget'
        config.add_widget Config::DashboardWidget.new(type, name || type, &block)
      end

    end

  end
end
