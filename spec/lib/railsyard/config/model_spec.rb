require 'spec_helper'

describe Railsyard::Backend::Config::Model do

  let(:model) { stub }
  subject { Railsyard::Backend::Config::Model.new(model) }

  it "takes a model class" do
    subject.model_class.should == model
  end

  %w(edit list label_method image_method).each do |attribute|
    it "can get and set :#{attribute} attribute" do
      subject.send("#{attribute}=", :foo)
      subject.send(attribute).should == :foo
    end
  end

end
