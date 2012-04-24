module Railsyard::Backend
  module Controller

    module Authentication
      include ActiveSupport::Concern
      delegate :current_user, to: :authenticator, allow_nil: true
      delegate :authenticate!, to: :authenticator, allow_nil: true

      def authenticator
        require 'railsyard-backend/authentication/none'

        if @authenticator.nil?
          authenticator_class = Railsyard::Backend.authentication_adapter || Railsyard::Backend::Authentication::None
          @authenticator = authenticator_class.new(self)
          if block = Railsyard::Backend.authenticator_initializer
            block.call(@authenticator)
          end
        end

        @authenticator
      end
    end

  end
end

