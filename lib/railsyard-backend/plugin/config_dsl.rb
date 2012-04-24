require 'railsyard-backend/support/dsl'

module Railsyard::Backend
  module Plugin

    class ConfigDsl < Support::Dsl
      delegate_to_config :name, :name=

      def backend_javascript_dependency(asset_path)
        config.backend_js_dependencies << asset_path
      end

      def backend_stylesheet_dependency(asset_path)
        config.backend_css_dependencies << asset_path
      end

    end

  end
end
