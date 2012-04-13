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

    end
  end
end
