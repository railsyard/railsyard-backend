module Railsyard::Backend
  module Config

    class Base
      def self.block_attr_accessor(name)
        attr_accessor name
        variable = "@#{name}".to_sym
        define_method "#{name}=" do |value = nil, &block|
          if block.present?
            instance_variable_set(variable, block)
          else
            instance_variable_set(variable, value)
          end
        end
      end
    end

  end
end
