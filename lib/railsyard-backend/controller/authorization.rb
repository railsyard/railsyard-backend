module Railsyard::Backend
  module Controller

    module Authorization
      include ActiveSupport::Concern
      delegate :authorize!, to: :authorizer, allow_nil: true

      def authorizer
        require 'railsyard-backend/authorization/none'

        if @authorizer.nil?
          authorizer_class = Railsyard::Backend.authorization_adapter || Railsyard::Backend::Authorization::None
          @authorizer = authorizer_class.new(self)
          if block = Railsyard::Backend.authorizer_initializer
            block.call(@authorizer)
          end
        end

        @authorizer
      end
    end

  end
end

