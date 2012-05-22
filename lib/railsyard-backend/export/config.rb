require 'blockenspiel'
require 'railsyard-backend/export/config_dsl'

module Railsyard::Backend
  module Export

    class Config

      attr_reader   :format
      attr_accessor :content_type
      attr_accessor :exporter

      def initialize(format, &block)
        @format = format
        Blockenspiel.invoke(block, ConfigDsl.new(self)) if block_given?
      end

      def data_for(record_or_collection)
        exporter.export(record_or_collection)
      end

      def send_data_options
        { type: content_type }
      end

    end

  end
end
