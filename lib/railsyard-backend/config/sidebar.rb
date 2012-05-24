require 'blockenspiel'
require 'railsyard-backend/dsl/sidebar'
require 'railsyard-backend/config/base'
require 'railsyard-backend/config/sidebar_group'

module Railsyard::Backend
  module Config

    class Sidebar < Base
      attr_reader :groups

      def initialize(&block)
        @groups = []
        Blockenspiel.invoke(block, Dsl::Sidebar.new(self)) if block_given?
      end

      def add_group(group)
        @groups << group
      end
    end

  end
end
