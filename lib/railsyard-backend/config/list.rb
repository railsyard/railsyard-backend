require 'blockenspiel'
require 'railsyard-backend/dsl/list'
require 'railsyard-backend/config/base'
require 'railsyard-backend/config/edit_group'


module Railsyard::Backend
  module Config

    class List < Base
      attr_accessor :sorting_type, :sorting_attribute, :page_size, :search_scope

      def initialize(&block)
        @fields = {}
        @page_size = 25
        Blockenspiel.invoke(block, Dsl::List.new(self)) if block_given?
      end

      def add_field(field_config)
        @fields[field_config.name] = field_config
      end

      def field(name)
        @fields[name.to_sym]
      end

      def fields
        @fields.values
      end

      def simple_sorting?
        sorting_type == :simple
      end

      def tree_sorting?
        sorting_type == :tree
      end

    end

  end
end
