require 'blockenspiel'
require 'railsyard-backend/dsl/base'

module Railsyard::Backend
  module Dsl

    class DashboardWidget < Base

      def method_missing(method_name, value)
        config[method_name.to_sym] = value
      end

    end

  end
end
