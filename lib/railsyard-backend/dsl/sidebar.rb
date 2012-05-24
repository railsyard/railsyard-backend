require 'blockenspiel'
require 'railsyard-backend/dsl/base'
require 'railsyard-backend/config/sidebar'

module Railsyard::Backend
  module Dsl

    class Sidebar < Base
      def group(*args, &block)
        config.add_group Config::SidebarGroup.new(*args, &block)
      end
    end

  end
end
