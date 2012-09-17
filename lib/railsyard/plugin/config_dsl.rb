require 'railsyard/support/dsl'

module Railsyard
  module Plugin

    class ConfigDsl < Support::Dsl
      delegate_value_or_block :name, to: :name=

      def backend_javascript_dependency(asset_path)
        config.backend_js_dependencies << asset_path
      end

      def backend_stylesheet_dependency(asset_path)
        config.backend_css_dependencies << asset_path
      end

      def generator_editor_type(*args)
        config.add_generator_editor_type *args
      end

      def authentication_infos(partial_path)
        config.authentication_partial = partial_path
      end

      def dashboard_widget(*args)
        config.add_dashboard_widget(*args)
      end

    end

  end
end
