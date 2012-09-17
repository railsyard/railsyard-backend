require 'blockenspiel'
require 'railsyard/dsl/base'
require 'railsyard/config/sidebar'

module Railsyard
  module Dsl

    class Sidebar < Base
      def group(*args, &block)
        config.add_group Config::SidebarGroup.new(*args, &block)
      end
    end

  end
end
