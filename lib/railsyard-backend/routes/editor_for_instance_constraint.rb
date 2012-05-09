require 'railsyard-backend/controller'

module Railsyard::Backend
  module Routes

    class EditorForInstanceConstraint
      include Controller::Instance

      def initialize(request)
        @request = request
      end

      def valid?
        editor_config.present?
      end

      def instance_params
        @request.params[instance_name]
      end

      def instance_name
        @request.params[:underscore_class_name]
      end

    end

  end
end
