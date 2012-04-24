require 'spec_helper'

describe Railsyard::Backend::Controller::Authorization do

  before do
    class Foobar
      include Railsyard::Backend::Controller::Authorization
    end
  end

  subject { Foobar.new }

  describe ".authorizer" do

    it "defaults to Railsyard::Authorization::None" do
      Railsyard.stubs(:authorization_adapter).returns(nil)
      Railsyard.stubs(:authorizer_initializer).returns(nil)
      subject.authorizer.should be_a Railsyard::Authorization::None
    end

    it "uses the configured adapter + given block otherwise" do
      custom_adapter = stub
      custom_adapter_class = stub
      custom_adapter_class.expects(:new).with(subject).returns(custom_adapter)

      Railsyard.stubs(:authorization_adapter).returns(custom_adapter_class)
      Railsyard.stubs(:authorizer_initializer).returns(Proc.new { |param|
        param.should == custom_adapter
      })

      subject.authorizer.should == custom_adapter
    end

  end

  describe ".authorize!" do

    it "delegates to authorizer" do
      user = stub
      authorizer = mock
      authorizer.expects(:authorize!)

      subject.stubs(:authorizer).returns(authorizer)
      subject.authorize!
    end

    it "returns nil if there's no authorizer" do
      subject.stubs(:authorizer).returns(nil)
      subject.authorize!.should be_nil
    end

  end

end

