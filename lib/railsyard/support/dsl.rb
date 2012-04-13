module Railsyard
  module Support

    class Dsl
      attr_reader :config
      include Blockenspiel::DSL

      def initialize(config)
        @config = config
      end

      def self.delegate_to_config(method, destination_method = nil)
        destination_method ||= method
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
