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

    end
  end
end
