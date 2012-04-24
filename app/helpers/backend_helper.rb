module BackendHelper

  def backend_form_for(object, *args, &block)
    require 'railsyard-backend/form_builder'
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(:builder => Railsyard::Backend::FormBuilder)), &block) << after_nested_form_callbacks
  end

  def model_t(model, options = {})
    model = model.class if model.class.ancestors.include? ActiveRecord::Base
    model.model_name.human(options)
  end

  def model_attr_t(model, attribute, options = {})
    model = model.class if model.class.ancestors.include? ActiveRecord::Base
    model.human_attribute_name(attribute, options)
  end

  def ry_t(field, options = {})
    I18n.t("railsyard.#{field}", options)
  end

  def index_label(model)
    ry_t("helpers.list", model: model_t(model, count: 2))
  end

  def new_label(model)
    ry_t("helpers.new", model: model_t(model))
  end

  def create_label(model)
    ry_t("helpers.create", model: model_t(model))
  end

  def edit_label(model)
    ry_t("helpers.edit", model: model_t(model))
  end

  def destroy_label(model)
    ry_t("helpers.destroy", model: model_t(model))
  end

  def after_nested_form(association, &block)
    @associations ||= []
    @after_nested_form_callbacks ||= []
    unless @associations.include?(association)
      @associations << association
      @after_nested_form_callbacks << block
    end
  end

  private
    def after_nested_form_callbacks
      @after_nested_form_callbacks ||= []
      fields = @after_nested_form_callbacks.map do |callback|
        callback.call
      end
      fields.join(" ").html_safe
    end
end
