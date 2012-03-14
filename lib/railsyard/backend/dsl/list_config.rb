require 'blockenspiel'

module Railsyard
  module Backend
    module Dsl

      class ListConfig
        include Blockenspiel::DSL
        def initialize(&block)
        end
      end

    end
  end
end
