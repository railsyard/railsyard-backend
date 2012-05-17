require 'blockenspiel'
require 'railsyard-backend/dsl/base'
require 'railsyard-backend/config/edit'
require 'railsyard-backend/config/list'

module Railsyard::Backend
  module Dsl

    class Model < Base
      delegate_value_or_block :label, to: :label_method=
      delegate_value_or_block :image, to: :image_method=

      def edit(&block)
        config.edit = Config::Edit.new(&block)
      end

      def list(&block)
        config.list = Config::List.new(&block)
      end
    end

  end
end
