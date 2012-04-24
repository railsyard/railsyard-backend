module Railsyard::Backend
  module Authentication

    class None

      def initialize(controller)
        @controller = controller
      end

      def authenticate!
        ## Do nothing!
      end

      def current_user
        ## No user!
        nil
      end

    end

  end
end
