module Railsyard
  module Authorization

    class None

      def initialize(controller)
        @controller = controller
      end

      def authorize!(action, object)
        ## Do nothing!
      end

    end

  end
end
