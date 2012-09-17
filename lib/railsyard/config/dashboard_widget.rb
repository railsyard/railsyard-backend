require 'blockenspiel'
require 'railsyard/config/base'
require 'railsyard/dsl/dashboard_widget'

module Railsyard
  module Config

    class DashboardWidget < Base

      attr_reader :type, :name

      def initialize(type, name, &block)
        @type = type.to_sym
        @name = name.to_sym
        @config = {}
        Blockenspiel.invoke(block, Dsl::DashboardWidget.new(self)) if block_given?
      end

      def []=(key, value)
        @config[key.to_sym] = value
      end

      def [](key)
        @config[key.to_sym]
      end

      def to_hash
        @config.clone
      end

    end

  end
end
