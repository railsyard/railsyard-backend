require 'spec_helper'

describe Railsyard::ResourcesController do

  describe "index" do

    it "authenticate, authorize and responds with collection" do
      controller.expects(:authenticate!)
      controller.expects(:authorize_action!)

      collection = stub
      controller.stubs(:collection).returns(collection)

      get :index
    end

  end

  pending "reorder"
  pending "edit"
  pending "update"
  pending "create"
  pending "new"

  describe "authorize_action!" do

    let(:resource) { stub }
    let(:resource_class) { stub }

    before do
      controller.stubs(:resource).returns(resource)
      controller.stubs(:resource_class).returns(resource_class)
      controller.stubs(:action_name).returns(:action_name)
    end

    context "on member actions" do
      it "it authorizes action name and the resource" do
        controller.stubs(:member_action?).returns(true)
        controller.expects(:authorize!).with(:action_name, resource)
        controller.send(:authorize_action!)
      end
    end

    context "on collection actions" do
      it "forwards current user, action name and the resource to the authorizer" do
        controller.stubs(:member_action?).returns(false)
        controller.expects(:authorize!).with(:action_name, resource_class)
        controller.send(:authorize_action!)
      end
    end

  end
end
