module Railsyard::Backend
  module Controller

    module Resource
      include ActiveSupport::Concern

      def collection
        @collection ||= resource_class.scoped
      end

      def resource
        @resource ||= resource_class.find(resource_id)
      end

      def build_resource
        @resource ||= resource_class.new(resource_params)
      end

      def resource_name
        collection_name.singularize
      end

      def resource_class
        return nil if collection_name.singularize == collection_name
        model_class_name = collection_name.classify
        if Object.const_defined? model_class_name
          model_class_name.constantize
        end
      end

      def editor_config
        @editor_config ||= Railsyard::Backend.editor_manager.editor_for(resource_class)
      end

    end

  end
end

