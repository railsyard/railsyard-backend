require 'railsyard/backend/config/model'

module Railsyard
  module Backend

    class Base
      def initialize
        @models = {}
      end

      def define_editor_for(model_class, &block)
        @models[model_class.name] = Config::Model.new(model_class, &block)
      end

      def editor_for(model_class)
        @models[model_class.name]
      end

      def editors
        @models.values
      end
    end

  end
end
