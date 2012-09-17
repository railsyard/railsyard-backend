require 'railsyard/plugin/config'

module Railsyard
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

      def generator_editor_type(name)
        plugins.collect { |p| p.generator_editor_type(name) }.compact.first
      end

      def authentication_partial
        @plugins.values.map(&:authentication_partial).compact.first
      end

      def dashboard_widget(type)
        @plugins.values.each do |plugin|
          if widget = plugin.dashboard_widget(type)
            return widget
          end
        end
        nil
      end

    end
  end
end
