module Railsyard
  module Backend
    module Controller

      module Filters
        include ActiveSupport::Concern

        def ensure_model_existance!
          unless resource_class.present?
            raise ActionController::RoutingError.new("Model not found.")
          end
        end

        def ensure_editor_existance!
          unless editor_config.present?
            raise ActionController::RoutingError.new("Railsyard editor not found.")
          end
        end

        def authorize_action!
          resource_to_authorize = member_action? ? resource : resource_class
          authorize!(action_name, resource_to_authorize)
        end

      end

    end
  end
end
