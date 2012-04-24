require 'blockenspiel'
require 'railsyard-backend/dsl/base'
require 'railsyard-backend/config/list_field'

module Railsyard::Backend
  module Dsl

    class List < Base

      def field(name, &block)
        config.add_field Config::ListField.new(name, &block)
      end

      def as_tree(options = {})
        options.symbolize_keys!
        options.assert_valid_keys(:using)
        config.sorting_type = :tree
        if options[:using].present?
          config.sorting_attribute = options[:using].to_sym
        end
      end

      def sortable(options = {})
        options.symbolize_keys!
        options.assert_valid_keys(:using)
        config.sorting_type = :simple
        if options[:using].present?
          config.sorting_attribute = options[:using].to_sym
        end
      end

    end

  end
end
