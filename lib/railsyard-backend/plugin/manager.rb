require 'railsyard-backend/plugin/config'

module Railsyard::Backend
  module Plugin
    class Manager

      def initialize
        @plugins = {}
      end

      def add_plugin(name, &block)
        @plugins[name.to_sym] = Config.new(&block)
      end

      def plugins
        @plugins.values
      end

      def authentication_partial
        @plugins.values.map(&:authentication_partial).first
      end

      def dashboard_widget(type)
        @plugins.values.each do |plugin|
          if widget = plugin.dashboard_widget(type)
            return widget
          end
        end
      end

    end
  end
end
