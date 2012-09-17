require 'blockenspiel'
require 'railsyard/dsl/base'

module Railsyard
  module Dsl

    class DashboardWidget < Base

      def method_missing(method_name, value)
        config[method_name.to_sym] = value
      end

    end

  end
end
