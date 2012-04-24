require 'spec_helper'

describe Railsyard::Backend::Controller::Filters do

  before do
    class Foobar
      include Railsyard::Backend::Controller::Filters
    end
  end

  subject { Foobar.new }

  describe "ensure_editor_existance!" do

    it "raises routing error if there's not an editor" do
      subject.stubs(:editor_config).returns(nil)
      lambda { subject.send(:ensure_editor_existance!) }.should raise_error(ActionController::RoutingError)
    end

    it "passes otherwise" do
      subject.stubs(:editor_config).returns(stub)
      lambda { subject.send(:ensure_editor_existance!) }.should_not raise_error(ActionController::RoutingError)
    end

  end

  describe "ensure_model_existance!" do

    it "raises routing error if there's not a valid resource_class" do
      subject.stubs(:resource_class).returns(nil)
      lambda { subject.send(:ensure_model_existance!) }.should raise_error(ActionController::RoutingError)
    end

    it "passes otherwise" do
      subject.stubs(:resource_class).returns(stub)
      lambda { subject.send(:ensure_model_existance!) }.should_not raise_error(ActionController::RoutingError)
    end

  end

  describe "authorize_action!" do

    let(:resource) { stub }
    let(:resource_class) { stub }

    before do
      subject.stubs(:resource).returns(resource)
      subject.stubs(:resource_class).returns(resource_class)
      subject.stubs(:action_name).returns(:action_name)
    end

    context "on member actions" do
      it "it authorizes action name and the resource" do
        subject.stubs(:member_action?).returns(true)
        subject.expects(:authorize!).with(:action_name, resource)
        subject.send(:authorize_action!)
      end
    end

    context "on collection actions" do
      it "forwards current user, action name and the resource to the authorizer" do
        subject.stubs(:member_action?).returns(false)
        subject.expects(:authorize!).with(:action_name, resource_class)
        subject.send(:authorize_action!)
      end
    end

  end

end
