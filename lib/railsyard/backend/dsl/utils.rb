module Railsyard
  module Backend
    module Dsl

      module Utils
        extend ActiveSupport::Concern

        module ClassMethods
          def conditional_dls_method(name, instance_variable_name)
            define_method name do |value = nil, &block|
              variable = "@#{instance_variable_name}".to_sym
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
end
