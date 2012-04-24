require 'blockenspiel'
require 'railsyard-backend/plugin/config_dsl'

module Railsyard::Backend
  module Plugin

    class Config

      attr_accessor :name
      attr_accessor :backend_js_dependencies
      attr_accessor :backend_css_dependencies

      def initialize(&block)
        @backend_js_dependencies = []
        @backend_css_dependencies = []
        Blockenspiel.invoke(block, ConfigDsl.new(self)) if block_given?
      end

    end

  end
end
