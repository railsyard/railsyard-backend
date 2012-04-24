module Railsyard
  module Backend
    module Controller

      module Authorization
        include ActiveSupport::Concern

        delegate :authorize!, to: :authorizer, allow_nil: true

        def authorizer
          require 'railsyard/authorization/none'

          if @authorizer.nil?
            authorizer_class = Railsyard.authorization_adapter || Railsyard::Authorization::None
            @authorizer = authorizer_class.new(self)
            if block = Railsyard.authorizer_initializer
              block.call(@authorizer)
            end
          end

          @authorizer
        end

      end

    end
  end
end

