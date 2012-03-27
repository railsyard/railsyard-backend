module BackendHelper

  def backend_form_for(object, *args, &block)
    require 'railsyard/form_builder'
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(:builder => Railsyard::FormBuilder)), &block)
  end

end
