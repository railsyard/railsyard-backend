require 'blockenspiel'

module Railsyard::Backend
  module Dsl

    class SidebarGroup < Base

      def resource(*args, &block)
        require 'railsyard-backend/config/sidebar_item'
        config.add_item Config::SidebarItem.new(:resource, *args, &block)
      end

      def instance(*args, &block)
        require 'railsyard-backend/config/sidebar_item'
        config.add_item Config::SidebarItem.new(:instance, *args, &block)
      end

    end

  end
end
