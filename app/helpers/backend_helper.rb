require 'railsyard/form_builder'

module BackendHelper

  def backend_form_for(object, *args, &block)
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(:builder => Railsyard::FormBuilder)), &block)
  end

end
