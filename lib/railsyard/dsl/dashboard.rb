require 'blockenspiel'
require 'railsyard/dsl/base'
require 'railsyard/config/dashboard_column'

module Railsyard
  module Dsl

    class Dashboard < Base
      def column(&block)
        config.add_column Config::DashboardColumn.new(&block)
      end
    end

  end
end
