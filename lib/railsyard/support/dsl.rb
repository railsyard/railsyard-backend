module Railsyard
  module Support

    class Dsl
      attr_reader :config
      include Blockenspiel::DSL

      def initialize(config)
        @config = config
      end

      def self.delegate_value_or_block(method, options = {})
        options.symbolize_keys!
        options.assert_valid_keys(:to)
        destination_method = options[:to] || method
        define_method method do |*args, &block|
          if block.present?
            config.send(destination_method, block)
          else
            config.send(destination_method, *args)
          end
        end
      end
    end

  end
end
