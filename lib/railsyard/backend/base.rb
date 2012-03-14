require 'railsyard/backend/dsl/model_config'

module Railsyard
  module Backend
    class Base

      def initialize
        @model_configurations = {}
      end

      def define_editor_for(model_class, &block)
        model_configuration = Dsl::ModelConfig.new(model_class, &block)
        @model_configurations[model_class] = model_configuration
      end

      def config_for_model(model_class)
        @model_configurations[model_class]
      end

    end
  end
end
