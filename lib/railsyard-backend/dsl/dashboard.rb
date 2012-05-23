require 'blockenspiel'
require 'railsyard-backend/dsl/base'
require 'railsyard-backend/config/sidebar'

module Railsyard::Backend
  module Dsl

    class Dashboard < Base
      def group(name, &block)
        config.add_row Config::DashboardRow.new(name, &block)
      end
    end

  end
end
