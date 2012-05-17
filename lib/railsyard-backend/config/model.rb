require 'blockenspiel'
require 'railsyard-backend/config/base'
require 'railsyard-backend/dsl/model'

module Railsyard::Backend
  module Config

    class Model < Base
      attr_accessor :model_class, :edit, :list, :label_method, :image_method

      def initialize(model_class, &block)
        @model_class = model_class
        Blockenspiel.invoke(block, Dsl::Model.new(self)) if block_given?
      end
    end

  end
end
