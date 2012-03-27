module Railsyard

  class FormBuilder < SimpleForm::FormBuilder

    def group(group_name, options = {}, &block)
      template.field_set_tag(translate(:groups, group_name), class: "group") do
        [
          template.content_tag(:p, translate(:group_hints, group_name), class: "hint"),
          template.capture(&block)
        ].compact.join.html_safe
      end
    end

    def translate(namespace, name, default='')
      model_names = lookup_model_names.dup
      lookups     = []

      while !model_names.empty?
        joined_model_names = model_names.join(".")
        model_names.shift

        lookups << :"#{joined_model_names}.#{lookup_action}.#{name}"
        lookups << :"#{joined_model_names}.#{name}"
      end
      lookups << :"defaults.#{lookup_action}.#{name}"
      lookups << :"defaults.#{name}"
      lookups << default

      I18n.t(lookups.shift, :scope => :"railsyard.#{namespace}", :default => lookups).presence
    end
  end

end
