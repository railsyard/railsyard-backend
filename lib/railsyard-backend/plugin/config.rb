require 'blockenspiel'
require 'railsyard-backend/plugin/config_dsl'

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

      def add_generator_editor_type(name, ar_type, editor_options)
         @generator_editor_types[name.to_sym] = {name: name.to_sym, ar_type: ar_type.to_sym, editor_options: editor_options.to_s}
      end

      def generator_editor_type(name)
        @generator_editor_types[name.to_sym]
      end

    end

  end
end
