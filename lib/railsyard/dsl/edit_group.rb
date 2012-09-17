require 'blockenspiel'

module Railsyard
  module Dsl

    class EditGroup < Base
      def field(*args, &block)
        require 'railsyard/config/edit_field'
        config.add_field Config::EditField.new(*args, &block)
      end
      def nested(*args, &block)
        require 'railsyard/config/nested_edit'
        config.add_nested Config::NestedEdit.new(*args, &block)
      end
    end

  end
end
