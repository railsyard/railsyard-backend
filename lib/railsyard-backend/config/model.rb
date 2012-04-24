require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/model'

module Railsyard::Backend
  module Config

    class Model < Base
      attr_accessor :model_class, :edit, :list, :l10n_attribute, :label_method

      def initialize(model_class, &block)
        @model_class = model_class
        Blockenspiel.invoke(block, Dsl::Model.new(self)) if block_given?
      end

      def localized?
        !!@l10n_attribute
      end
    end

  end
end
