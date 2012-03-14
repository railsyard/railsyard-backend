require 'spec_helper'

describe Railsyard do
  it ".backend returns a Railsyard::Backend" do
    backend = Railsyard.backend
    backend.should be_a Railsyard::Backend::Base
  end
end
