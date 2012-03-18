require 'railsyard/authorization/none'

module Railsyard
  module Authorization

    class Cancan < None

      attr_accessor :ability_class

      def authorize_action!(action, object)
        ability = @ability_class.new(@controller.current_user)
        ability.authorize!(action, object)
      end

    end

  end
end
