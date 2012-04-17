require 'blockenspiel'
require 'railsyard/backend/dsl/edit'
require 'railsyard/backend/config/base'
require 'railsyard/backend/config/edit_group'


module Railsyard
  module Backend
    module Config

      class NestedEdit < Edit

        attr_reader :options, :name

        def initialize(name, options = {}, &block)
          @options = options
          @name = name
          super(&block)
        end

      end

    end
  end
end
