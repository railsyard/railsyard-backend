require 'spec_helper'

describe Railsyard::Plugin::ConfigGenerator do

  subject do
    test = "This is just a %{test}, %{ok}?"
    Railsyard::Plugin::ConfigGenerator.new(:my_awesome_plugin, {test => :string}, test, test)
  end

  it "lets you retrieve fields interpolating variables" do
    subject.fields(test: "watermelon").first[:name].should == "This is just a watermelon, ?"
  end

  %w(editor_config model_config).each do |attr|
    it "lets you retrieve :#{attr} interpolating variables" do
      subject.send(attr, test: "watermelon").should == "This is just a watermelon, ?"
    end
  end

end
