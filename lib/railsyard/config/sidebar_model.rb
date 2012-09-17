require 'blockenspiel'
require 'railsyard/config/base'

module Railsyard
  module Config

    class SidebarModel < Base

      attr_reader :type, :model_class

      def initialize(type, model_class)
        @type = type.to_sym
        @model_class = model_class
      end

    end

  end
end
