require 'blockenspiel'
require 'railsyard-backend/dsl/edit_group'
require 'railsyard-backend/config/base'

module Railsyard::Backend
  module Config

    class SidebarGroup < Base
      attr_reader :name

      def initialize(name, &block)
        @name = name.to_sym
        Blockenspiel.invoke(block, Dsl::SidebarGroup.new(self)) if block_given?
      end

    end

  end
end
