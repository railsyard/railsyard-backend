require 'railsyard-backend/config/edit'

module Railsyard::Backend
  module Config

    class NestedEdit < Edit

      attr_reader :options, :name

      def initialize(name, options = {}, &block)
        @options = options
        @name = name
        super(&block)
      end

      def render(form, context)
        object = form.object
        association = object.class.reflect_on_association(name)

        nested_form = form.simple_fields_for(name) do |subform|
          nested_form = context.render("railsyard/resources/nested_form", form: subform, config: self)
          remove_field = context.content_tag(:div, class: "input remove-fields") do
            subform.link_to_remove(context.destroy_label(subform.object), name, class: "button", data: { confirm: context.destroy_confirm_label })
          end
          [ nested_form, remove_field ].join.html_safe
        end

        add_new_field = form.link_to_add(context.new_label(association.klass), name, class: "button")

        [
          nested_form,
          add_new_field
        ].join.html_safe
      end

    end

  end
end
