require 'railsyard-backend/support/dsl'

module Railsyard::Backend
  module Plugin

    class ConfigDsl < Support::Dsl
      delegate_value_or_block :name, to: :name=

      def backend_javascript_dependency(asset_path)
        config.backend_js_dependencies << asset_path
      end

      def backend_stylesheet_dependency(asset_path)
        config.backend_css_dependencies << asset_path
      end

      def authentication_infos(partial_path)
        config.authentication_partial = partial_path
      end
    end

  end
end
