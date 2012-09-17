module Railsyard::Backend

  class FormBuilder < SimpleForm::FormBuilder

    def group(group_name, options = {}, &block)
      group_legend = translate(group_name, "railsyard.groups", group_name.to_s.titleize)
      group_hint = translate(group_name, "railsyard.group_hints")

      group_legend = template.link_to group_legend, "##{group_name}", data: { behaviour: "dom-toggle", translation_keys: translate_lookups(group_name) }
      [
       template.content_tag(:h3, group_legend, class: 'group-header'),
       template.content_tag(:div, id: group_name, class: 'group-content') do
         [
          (template.content_tag(:p, group_hint, class: "hint") if group_hint.present?),
           template.capture(&block)
         ].join.html_safe
       end
      ].join.html_safe
    end

    def translate(name, scope, default = '')
      i18n_lookup_keys = translate_lookups(name, default)
      I18n.t(i18n_lookup_keys.shift, :scope => scope.to_sym, :default => i18n_lookup_keys, model: object.class.model_name.human)
    end

    def translate_lookups(name, default = '')
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

      lookups
    end

    def link_to_add(*args, &block)
      options = args.extract_options!.symbolize_keys
      association = args.pop
      complete_association_name = "#{object_name}_#{association}".gsub(/[\[\]]+/, '_')
      options[:class] = [options[:class], "add_nested_fields"].compact.join(" ")
      options["data-association"] = complete_association_name
      options["data-association-type"] = object.class.reflect_on_association(association).macro
      args << (options.delete(:href) || "javascript:void(0)")
      args << options
      @fields ||= {}
      @template.after_nested_form(complete_association_name) do
        model_object = object.class.reflect_on_association(association).klass.new
        output = %Q[<div id="#{complete_association_name}_fields_blueprint" class="nested_form_blueprint" style="display: none">].html_safe
        output << fields_for(association, model_object, :child_index => "new_#{complete_association_name}", &@fields[complete_association_name])
        output.safe_concat('</div>')
        output
      end
      @template.link_to(*args, &block)
    end

    def link_to_remove(*args, &block)
      options = args.extract_options!.symbolize_keys
      association = args.pop
      complete_association_name = "#{parent_builder.object_name}_#{association}".gsub(/[\[\]]+/, '_')
      options[:class] = [options[:class], "remove_nested_fields"].compact.join(" ")
      options["data-association"] = complete_association_name
      options["data-association-type"] = parent_builder.object.class.reflect_on_association(association).macro
      args << (options.delete(:href) || "javascript:void(0)")
      args << options
      hidden_field(:_destroy) + @template.link_to(*args, &block)
    end

    def fields_for_with_nested_attributes(association_name, *args)
      # TODO Test this better
      complete_association_name = "#{object_name}_#{association_name}".gsub(/[\[\]]+/, '_')
      block = args.pop || Proc.new { |fields| @template.render(:partial => "#{complete_association_name.to_s.singularize}_fields", :locals => {:f => fields}) }
      @fields ||= {}
      @fields[complete_association_name] = block
      super(association_name, *(args << block))
    end

    def fields_for_nested_model(name, object, options, block)
      output = '<div class="fields">'.html_safe
      output << super
      output.safe_concat('</div>')
      output
    end

    def error_messages
      return unless object.respond_to?(:errors) && object.errors.any?

      @template.content_tag(:ul, class: "errors") do
        object.errors.full_messages.map do |error|
          @template.content_tag(:li, error)
        end.join.html_safe
      end
    end


  end

end
