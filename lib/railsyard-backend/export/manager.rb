require 'railsyard-backend/export/config'

module Railsyard::Backend
  module Export
    class Manager

      def initialize
        @exporters = {}
      end

      def register(format, &block)
        @exporters[format.to_sym] = Config.new(format.to_sym, &block)
      end

      def exporters
        @exporters.values
      end

      def exporter_for(format)
        @exporters[format.to_sym]
      end

    end
  end
end
