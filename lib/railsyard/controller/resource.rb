module Railsyard
  module Controller

    module Resource
      include ActiveSupport::Concern

      def collection
        if editor_config.list.view_mode.simple?
          collection = resource_class.scoped
          unless params[:disable_pagination].present?
            collection = collection.page(params[:page]).per(editor_config.list.page_size)
          end
          if (search_scope = editor_config.list.search_scope).present? && params[:query].present?
            collection = collection.send(search_scope, params[:query])
          end
        else
          collection = resource_class.send(editor_config.list.tree_roots_scope)
        end
        collection
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
        @editor_config ||= Railsyard.editor_manager.editor_for(resource_class)
      end

    end

  end
end

