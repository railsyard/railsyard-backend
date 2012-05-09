module Railsyard::Backend

  class EditorManager
    def initialize
      @editors = {}
      @instance_editors = {}
    end

    def define_editor_for(model_class, &block)
      require 'railsyard-backend/config/model'
      @editors[model_class.name] = Config::Model.new(model_class, &block)
    end

    def define_instance_editor_for(model_class, &block)
      require 'railsyard-backend/config/edit'
      @instance_editors[model_class.name] = Config::Edit.new(&block)
    end

    def editor_for(model_class)
      return nil if model_class.nil?
      @editors[model_class.name]
    end

    def instance_editor_for(model_class)
      return nil if model_class.nil?
      @instance_editors[model_class.name]
    end

    def editors
      @editors.values
    end

    def instance_editors
      @instance_editors
    end

  end

end
