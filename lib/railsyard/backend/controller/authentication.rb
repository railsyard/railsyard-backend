module Railsyard
  module Backend
    module Controller

      module Authentication
        include ActiveSupport::Concern

        delegate :current_user, to: :authenticator, allow_nil: true
        delegate :authenticate!, to: :authenticator, allow_nil: true

        def authenticator
          require 'railsyard/authentication/none'

          if @authenticator.nil?
            authenticator_class = Railsyard.authentication_adapter || Railsyard::Authentication::None
            @authenticator = authenticator_class.new(self)
            if block = Railsyard.authenticator_initializer
              block.call(@authenticator)
            end
          end

          @authenticator
        end

      end

    end
  end
end

