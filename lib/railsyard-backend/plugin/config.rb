require 'blockenspiel'
require 'railsyard-backend/plugin/config_dsl'
require 'railsyard-backend/plugin/config_generator'

module Railsyard::Backend
  module Plugin

    class Config

      attr_accessor :name
      attr_accessor :backend_js_dependencies
      attr_accessor :backend_css_dependencies
      attr_accessor :authentication_partial

      def initialize(&block)
        @backend_js_dependencies = []
        @backend_css_dependencies = []
        @generator_editor_types = {}
        Blockenspiel.invoke(block, ConfigDsl.new(self)) if block_given?
      end

      def add_generator_editor_type(name, fields, editor_config, model_config=nil)
        @generator_editor_types[name.to_sym] = ConfigGenerator.new(name, fields, editor_config, model_config)
      end

      def generator_editor_type(name)
        @generator_editor_types[name.to_sym]
      end

    end

  end
end
