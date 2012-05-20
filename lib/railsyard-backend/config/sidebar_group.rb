require 'blockenspiel'
require 'railsyard-backend/dsl/sidebar_group'
require 'railsyard-backend/config/base'

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
        @items[item_config.name] = item_config
      end

      def item(name)
        @items[name.to_sym]
      end

      def items
        @items.values
      end

    end

  end
end
