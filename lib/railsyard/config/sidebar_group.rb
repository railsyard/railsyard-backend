require 'blockenspiel'
require 'railsyard/config/base'
require 'railsyard/dsl/sidebar_group'

module Railsyard
  module Config

    class SidebarGroup < Base
      attr_reader :name, :items

      def initialize(name=nil, &block)
        @name = name
        @items = []
        Blockenspiel.invoke(block, Dsl::SidebarGroup.new(self)) if block_given?
      end

      def add_item(item)
        @items << item
      end

    end

  end
end
