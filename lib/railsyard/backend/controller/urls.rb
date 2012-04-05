module Railsyard
  module Backend
    module Controller

      module Urls
        include ActiveSupport::Concern

        def resources_path
          index_path(resource_class: collection_name)
        end

        def reorder_resources_path
          reorder_path(resource_class: collection_name)
        end

        def resource_path
          show_path(resource_class: collection_name, id: resource)
        end

        def create_resource_path
          create_path(resource_class: collection_name)
        end

        def update_resource_path
          update_path(resource_class: collection_name, id: resource)
        end

        def new_resource_path
          new_path(resource_class: collection_name, id: resource)
        end

        def destroy_resource_path
          destroy_path(resource_class: collection_name, id: resource)
        end

      end

    end
  end
end

