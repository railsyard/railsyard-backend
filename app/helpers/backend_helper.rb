module BackendHelper

  def backend_form_for(object, *args, &block)
    require 'railsyard/form_builder'
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(:builder => Railsyard::FormBuilder)), &block)
  end

  def simple_form_translate(model, namespace, name, default='')
    model_name = model.name.tableize
    lookups     = []

    lookups << :"#{model_name}.#{action_name}.#{name}"
    lookups << :"#{model_name}.#{name}"
    lookups << :"defaults.#{action_name}.#{name}"
    lookups << :"defaults.#{name}"
    lookups << default

    I18n.t(lookups.shift, :scope => :"simple_form.#{namespace}", :default => lookups).presence
  end


end
