require 'railsyard/controller'

module Railsyard
  module Routes

    class EditorForResourceConstraint
      include Controller::Resource

      def initialize(request, attribute_presence)
        @request = request
        @attribute_presence = attribute_presence
      end

      def valid?
        editor_config.present? && editor_config.send(@attribute_presence).present?
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
