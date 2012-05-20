require 'railsyard-backend/config/base'

module Railsyard::Backend
  module Config


    class Sidebar < Base

      def initialize(&block)
        @groups = {}
        Blockenspiel.invoke(block, Dsl::Sidebar.new(self)) if block_given?
      end

      def add_group(group_config)
        @groups[group_config.name] = group_config
      end

      def groups
        @groups.values
      end

      def group(name)
        @groups[name.to_sym]
      end

    end

  end
end
