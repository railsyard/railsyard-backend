require 'blockenspiel'
require 'railsyard-backend/dsl/base'
require 'railsyard-backend/config/dashboard_column'

module Railsyard::Backend
  module Dsl

    class Dashboard < Base
      def column(&block)
        config.add_column Config::DashboardColumn.new(&block)
      end
    end

  end
end
