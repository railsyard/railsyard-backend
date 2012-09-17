require 'spec_helper'

describe Railsyard::Controller::Authentication do

  before do
    class Foobar
      include Railsyard::Controller::Authentication
    end
  end

  subject { Foobar.new }

  describe ".authenticator" do

    it "defaults to Railsyard::Authentication::None" do
      Railsyard.stubs(:authentication_adapter).returns(nil)
      Railsyard.stubs(:authenticator_initializer).returns(nil)
      subject.authenticator.should be_a Railsyard::Authentication::None
    end

    it "uses the configured adapter + given block otherwise" do
      custom_adapter = stub
      custom_adapter_class = stub
      custom_adapter_class.expects(:new).with(subject).returns(custom_adapter)

      Railsyard.stubs(:authentication_adapter).returns(custom_adapter_class)
      Railsyard.stubs(:authenticator_initializer).returns(Proc.new { |param|
        param.should == custom_adapter
      })

      subject.authenticator.should == custom_adapter
    end

  end

  describe ".current_user" do

    it "delegates to authenticator" do
      user = stub
      authenticator = stub(current_user: user)
      subject.stubs(:authenticator).returns(authenticator)
      subject.current_user.should == user
    end

    it "returns nil if there's no authenticator" do
      subject.stubs(:authenticator).returns(nil)
      subject.current_user.should be_nil
    end

  end

end
