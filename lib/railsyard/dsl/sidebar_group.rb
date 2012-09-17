require 'blockenspiel'

module Railsyard
  module Dsl

    class SidebarGroup < Base

      def resource(*args, &block)
        require 'railsyard/config/sidebar_model'
        config.add_item Config::SidebarModel.new(:resource, *args, &block)
      end

      def instance(*args, &block)
        require 'railsyard/config/sidebar_model'
        config.add_item Config::SidebarModel.new(:instance, *args, &block)
      end

      def link(*args, &block)
        require 'railsyard/config/sidebar_link'
        config.add_item Config::SidebarLink.new(:link, *args, &block)
      end

    end

  end
end
