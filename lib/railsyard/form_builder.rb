module Railsyard

  class FormBuilder < SimpleForm::FormBuilder

    def group(group_name, options = {}, &block)
      group_legend = template.link_to translate(:groups, group_name), '#'
      group_hint = translate(:group_hints, group_name)
      [
       template.content_tag( :h3, group_legend, data: {behaviour: "groups-toggle"} ),
       template.content_tag( :div, data: {behaviour: "groups-toggle"} ) do
         [
          (template.content_tag(:p, group_hint, class: "hint") if group_hint.present?),
           template.capture(&block)
           ].join.html_safe
        end
      ].join.html_safe
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
