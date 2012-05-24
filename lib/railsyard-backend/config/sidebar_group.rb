require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/sidebar_group'

module Railsyard::Backend
  module Config

    class SidebarGroup < Base
      attr_reader :name, :items

      def initialize(name, &block)
        @name = name.to_sym
        @items = []
        Blockenspiel.invoke(block, Dsl::SidebarGroup.new(self)) if block_given?
      end

      def add_item(item)
        @items << item
      end

    end

  end
end
