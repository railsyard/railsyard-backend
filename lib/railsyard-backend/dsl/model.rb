require 'blockenspiel'
require 'railsyard-backend/dsl/base'
require 'railsyard-backend/config/edit'
require 'railsyard-backend/config/list'

module Railsyard::Backend
  module Dsl

    class Model < Base
      delegate_to_config :label, :label_method=

      def edit(&block)
        config.edit = Config::Edit.new(&block)
      end

      def list(&block)
        config.list = Config::List.new(&block)
      end

      def localized(options)
        options.symbolize_keys!
        options.assert_valid_keys(:with)
        config.l10n_attribute = options[:with].to_sym
      end
    end

  end
end
