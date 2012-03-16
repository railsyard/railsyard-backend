require 'spec_helper'

describe Railsyard::Backend::Dsl::ListField do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::ListField.new(config) }

  describe ".date_format" do
    it "saves the value in the config object" do
      config.expects(:date_format=)
      subject.date_format(true)
    end
  end

  describe ".read_only" do
    it "saves the value in the config object" do
      config.expects(:format=)
      subject.format_as(true)
    end
  end

  describe ".use_partial" do
    it "saves the value in the config object" do
      config.expects(:partial=)
      subject.use_partial(true)
    end
  end

  describe ".visible" do
    it "saves the value in the config object" do
      config.expects(:visible=)
      subject.visible(true)
    end
  end

end

