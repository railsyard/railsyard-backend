module UrlsHelper

  def resources_path(obj)
    Rails.application.routes.url_helpers.resources_path(tableized_class_name: model_name(obj).tableize)
  end

  def reorder_resources_path(obj)
    Rails.application.routes.url_helpers.reorder_resources_path(tableized_class_name: model_name(obj).tableize)
  end

  def new_resource_path(obj)
    Rails.application.routes.url_helpers.new_resource_path(tableized_class_name: model_name(obj).tableize)
  end

  def create_resource_path(obj)
    Rails.application.routes.url_helpers.create_resource_path(tableized_class_name: model_name(obj).tableize)
  end

  def edit_resource_path(obj)
    Rails.application.routes.url_helpers.edit_resource_path(tableized_class_name: model_name(obj).tableize, id: obj)
  end

  def update_resource_path(obj)
    Rails.application.routes.url_helpers.update_resource_path(tableized_class_name: model_name(obj).tableize, id: obj)
  end

  def destroy_resource_path(obj)
    Rails.application.routes.url_helpers.destroy_resource_path(tableized_class_name: model_name(obj).tableize, id: obj)
  end

  def edit_instance_path(obj)
    Rails.application.routes.url_helpers.edit_instance_path(underscore_class_name: model_name(obj).underscore)
  end

  def update_instance_path(obj)
    Rails.application.routes.url_helpers.update_instance_path(underscore_class_name: model_name(obj).underscore)
  end

  def edit_enabled_for_resource(obj)
    editor = Railsyard::Backend.editor_manager.editor_for(model_class(obj))
    editor.present? && editor.edit.present?
  end

  private

  def model_class(obj)
    if obj.is_a? ActiveModel::Naming
      obj
    else
      obj.class
    end
  end

  def model_name(obj)
    model_class(obj).name
  end

end
