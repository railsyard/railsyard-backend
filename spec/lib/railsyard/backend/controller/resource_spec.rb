require 'spec_helper'

describe Railsyard::Backend::Controller::Resource do

  before do
    class Foobar
      include Railsyard::Backend::Controller::Resource
    end
  end

  subject { Foobar.new }

  describe "resource_class" do

    it "constantize .collection_name, if it exists" do
      class ExampleModel; end
      subject.stubs(:collection_name).returns("example_models")
      subject.send(:resource_class).should == ExampleModel
    end

    it "return nils on singular collection_names" do
      class ExampleModel; end
      subject.stubs(:collection_name).returns("example_model")
      subject.send(:resource_class).should be_nil
    end

    it "returns nil otherwise" do
      subject.stubs(:collection_name).returns("foo")
      subject.send(:resource_class).should be_nil
    end

  end

end
