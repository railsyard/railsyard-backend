require 'spec_helper'

describe Railsyard do

  it ".backend returns a Railsyard::Backend" do
    backend = Railsyard.backend
    backend.should be_a Railsyard::Backend::Base
  end

  it "can store custom settings" do
    swap Railsyard, authentication_adapter: :foo, authorizer_initializer: :bar do
      Railsyard.authentication_adapter.should == :foo
      Railsyard.authorizer_initializer.should == :bar
    end
  end

end
