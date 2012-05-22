require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/model'

module Railsyard::Backend
  module Config

    class Model < Base
      attr_accessor :model_class, :edit, :list, :label_method, :image_method
      attr_reader :accepted_exports

      def initialize(model_class, &block)
        @model_class = model_class
        @accepted_exports = Set.new
        Blockenspiel.invoke(block, Dsl::Model.new(self)) if block_given?
      end

      def add_export_format(format)
        @accepted_exports.add(format.to_sym)
      end

      def exportable_as?(format)
        @accepted_exports.include? format.to_sym
      end

    end

  end
end
