module Railsyard
  module Config

    class Base

      protected

      def value_or_call(value, *args)
        if value.respond_to?(:call)
          value.call(*args)
        else
          value
        end
      end

    end

  end
end
