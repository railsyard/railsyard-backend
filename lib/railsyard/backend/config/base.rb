module Railsyard
  module Backend
    module Config

      class Base

        def self.conditional_config(name)

          attr_accessor name
          variable = "@#{name}".to_sym

          define_method "#{name}=" do |value = nil, &block|
            if block.present?
              instance_variable_set(variable, block)
            elsif value.is_a? Hash
              value = value.dup
              value.symbolize_keys!
              value.assert_valid_keys(:if, :unless)
              if value[:if] && !value[:if].respond_to?(:call)
                raise ArgumentError, ":if option expects a callable object"
              end
              if value[:unless] && !value[:unless].respond_to?(:call)
                raise ArgumentError, ":unless option expects a callable object"
              end
              instance_variable_set(variable, value)
            else
              instance_variable_set(variable, value)
            end
          end
        end

      end

    end
  end
end
