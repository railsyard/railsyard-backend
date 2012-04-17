require 'blockenspiel'
require 'railsyard/backend/config/edit_field'

module Railsyard
  module Backend
    module Dsl

      class EditGroup < Base
        def field(*args, &block)
          config.add_field Config::EditField.new(*args, &block)
        end
        def nested(*args, &block)
          config.add_nested Config::NestedEdit.new(*args, &block)
        end
      end

    end
  end
end
