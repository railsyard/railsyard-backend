module Railsyard::Backend
  module Plugin

    class ConfigGenerator

      attr_accessor :name

      def initialize(name, fields, editor_config, model_config)
        @name = name
        @fields = fields
        @editor_config = editor_config
        @model_config = model_config
      end

      def fields(variables={})
        @fields.collect do |k,v|
          {name: interpolate_string(k, variables),
           type: v}
        end
      end

      def editor_config(variables={})
        interpolate_string(@editor_config, variables)
      end

      def model_config(variables={})
        interpolate_string(@model_config, variables) if @model_config
      end

    private

      # replaces %{foo} with variables[:foo]
      def interpolate_string(string, variables)
        string.gsub(/%\{([^\}]*)(\})/) { |s| variables[$1.to_sym] }
      end

    end

  end
end
