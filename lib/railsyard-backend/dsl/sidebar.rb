require 'blockenspiel'
require 'railsyard-backend/dsl/base'
require 'railsyard-backend/config/sidebar'

module Railsyard::Backend
  module Dsl

    class Sidebar < Base
      def group(name, &block)
        config.add_group Config::SidebarGroup.new(name, &block)
      end
    end

  end
end
