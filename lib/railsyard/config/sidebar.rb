require 'blockenspiel'
require 'railsyard/dsl/sidebar'
require 'railsyard/config/base'
require 'railsyard/config/sidebar_group'

module Railsyard
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
