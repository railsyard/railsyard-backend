require 'spec_helper'

describe Railsyard::EditorManager do

  describe ".define_editor_for" do
    let(:model) { stub }
    let(:model_config) { stub }

    it "setup a Config::Model for the specified model" do
      model = stub(name: :class_name)
      Railsyard::Config::Model.expects(:new).with(model)
      subject.define_editor_for(model)
    end

  end

  describe ".editor_for" do
    it "returns an editor by model" do
      model = stub(name: :class_name)
      model_config = stub
      Railsyard::Config::Model.stubs(:new).returns(model_config)
      subject.define_editor_for(model)
      subject.editor_for(model).should == model_config
    end
  end

end

