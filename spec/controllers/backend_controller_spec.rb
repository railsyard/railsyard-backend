require 'spec_helper'

describe Railsyard::BackendController do

  describe "index" do

    it "check for model and model editor presence, authenticate, authorize and responds with collection" do
      controller.expects(:ensure_model_existance!)
      controller.expects(:ensure_editor_existance!)
      controller.expects(:authenticate!)
      controller.expects(:authorize_action!)

      collection = stub
      controller.stubs(:collection).returns(collection)

      get :index
    end

  end

end
