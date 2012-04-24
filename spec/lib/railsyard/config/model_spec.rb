require 'spec_helper'

describe Railsyard::Backend::Config::Model do

  let(:model) { stub }
  subject { Railsyard::Backend::Config::Model.new(model) }

  it "takes a model class" do
    subject.model_class.should == model
  end

  %w(edit list l10n_attribute label_method).each do |attribute|
    it "can get and set :#{attribute} attribute" do
      subject.send("#{attribute}=", :foo)
      subject.send(attribute).should == :foo
    end
  end

  describe ".localized?" do
    it "is true if there's a :l10n_attribute" do
      subject.l10n_attribute = :foo
      subject.should be_localized
    end
    it "is false if there's no :l10n_attribute" do
      subject.should_not be_localized
    end
  end

end
