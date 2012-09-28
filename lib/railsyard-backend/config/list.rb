require 'blockenspiel'
require 'railsyard-backend/dsl/list'
require 'railsyard-backend/config/base'
require 'railsyard-backend/config/edit_group'


module Railsyard::Backend
  module Config

    class List < Base
      # simple or tree?
      attr_accessor :view_mode

      # integer position for simple mode, parent id for tree mode
      attr_accessor :sorting_enabled, :sorting_attribute
      alias_method :sorting_enabled?, :sorting_enabled

      # as tree sortable
      attr_accessor :tree_parent_method, :tree_children_method, :tree_roots_scope

      # pagination
      attr_accessor :page_size

      # search
      attr_accessor :search_scope

      attr_reader :footer_partials

      def initialize(&block)
        @fields = {}
        @footer_partials = []
        self.page_size = 25
        self.view_mode = :simple
        self.tree_children_method = :children
        self.tree_parent_method = :parent
        self.tree_roots_scope = :roots
        self.sorting_enabled = false
        self.sorting_attribute = :position
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

      def view_mode=(mode)
        @view_mode = ActiveSupport::StringInquirer.new(mode.to_s)
      end

      def add_footer_partial(partial)
        @footer_partials << partial
      end

    end
  end
end
