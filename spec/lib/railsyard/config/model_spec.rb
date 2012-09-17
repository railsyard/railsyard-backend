require 'spec_helper'

describe Railsyard::Config::Model do

  let(:model) { stub }
  subject { Railsyard::Config::Model.new(model) }

  it "takes a model class" do
    subject.model_class.should == model
  end

  %w(edit list label_method image_method).each do |attribute|
    it "can get and set :#{attribute} attribute" do
      subject.send("#{attribute}=", :foo)
      subject.send(attribute).should == :foo
    end
  end

  define ".add_export_format" do
    it "adds the specified format to the list of accepted export formats" do
      subject.exportable_as?(:foobar).should be_false
      subject.add_export_format(:foobar)
      subject.exportable_as?(:foobar).should be_true
      subject.accepted_exports.should include :foobar
    end
  end

end
