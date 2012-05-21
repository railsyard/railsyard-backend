require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/sidebar_group'

module Railsyard::Backend
  module Config

    class SidebarGroup < Base
      attr_reader :name

      def initialize(name, &block)
        @name = name.to_sym
        @items = {}
        Blockenspiel.invoke(block, Dsl::SidebarGroup.new(self)) if block_given?
      end

      def add_item(item_config)
        @items[item_config.model_class.name] = item_config
      end

      def item(model_class)
        @items[model_class.name]
      end

      def items
        @items.values
      end

    end

  end
end
