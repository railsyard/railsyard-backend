module Railsyard

  class FormBuilder < SimpleForm::FormBuilder

    def group(group_name, options = {}, &block)
      group_legend = template.link_to translate(:groups, group_name, group_name.to_s.titleize), "##{group_name}"
      group_hint = translate(:group_hints, group_name)
      [
       template.content_tag( :h3, group_legend, id: group_name, data: {behaviour: "groups-toggle"} ),
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

    def link_to_add(*args, &block)
      options = args.extract_options!.symbolize_keys
      association = args.pop
      options[:class] = [options[:class], "add_nested_fields"].compact.join(" ")
      options["data-association"] = association
      options["data-association-type"] = object.class.reflect_on_association(association).macro
      args << (options.delete(:href) || "javascript:void(0)")
      args << options
      @fields ||= {}
      @template.after_nested_form(association) do
        model_object = object.class.reflect_on_association(association).klass.new
        output = %Q[<div id="#{association}_fields_blueprint" class="nested_form_blueprint" style="display: none">].html_safe
        output << fields_for(association, model_object, :child_index => "new_#{association}", &@fields[association])
        output.safe_concat('</div>')
        output
      end
      @template.link_to(*args, &block)
    end

    def link_to_remove(*args, &block)
      options = args.extract_options!.symbolize_keys
      association = args.pop
      options[:class] = [options[:class], "remove_nested_fields"].compact.join(" ")
      options["data-association"] = association
      options["data-association-type"] = parent_builder.object.class.reflect_on_association(association).macro
      args << (options.delete(:href) || "javascript:void(0)")
      args << options
      hidden_field(:_destroy) + @template.link_to(*args, &block)
    end

    def fields_for_with_nested_attributes(association_name, *args)
      # TODO Test this better
      block = args.pop || Proc.new { |fields| @template.render(:partial => "#{association_name.to_s.singularize}_fields", :locals => {:f => fields}) }
      @fields ||= {}
      @fields[association_name] = block
      super(association_name, *(args << block))
    end

    def fields_for_nested_model(name, object, options, block)
      output = '<div class="fields">'.html_safe
      output << super
      output.safe_concat('</div>')
      output
    end

  end

end
