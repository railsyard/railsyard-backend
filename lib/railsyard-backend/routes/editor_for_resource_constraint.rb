require 'railsyard-backend/controller'

module Railsyard::Backend
  module Routes

    class EditorForResourceConstraint
      include Controller::Resource

      def initialize(request)
        @request = request
      end

      def valid?
        editor_config.present?
      end

      def resource_id
        @request.params[:id]
      end

      def collection_name
        @request.params[:tableized_class_name]
      end

      def resource_params
        @request.params[resource_name]
      end
    end

  end
end
