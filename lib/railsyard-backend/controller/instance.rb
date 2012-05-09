module Railsyard::Backend
  module Controller

    module Instance
      include ActiveSupport::Concern

      def instance
        @instance ||= instance_class.instance
      end

      def instance_class
        instance_class_name = instance_name.camelize
        if Object.const_defined? instance_class_name
          instance_class_name.constantize
        end
      end

      def editor_config
        @editor_config ||= Railsyard::Backend.editor_manager.instance_editor_for(instance_class)
      end

    end

  end
end


