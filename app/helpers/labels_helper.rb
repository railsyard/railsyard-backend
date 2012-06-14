module LabelsHelper

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

  def destroy_confirm_label(model)
    label = model.send(editor_config.label_method)
    ry_t("helpers.destroy_confirm", label: label)
  end

  def model_t(model, options = {})
    model = model.class if model.class.respond_to? :model_name
    model.model_name.human(options)
  end

  def model_attr_t(model, attribute, options = {})
    model = model.class if model.class.respond_to? :model_name
    model.human_attribute_name(attribute, options)
  end

  def ry_t(field, options = {})
    I18n.t("railsyard.#{field}", options)
  end

end
