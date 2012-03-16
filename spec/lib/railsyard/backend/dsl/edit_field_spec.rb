require 'spec_helper'

describe Railsyard::Backend::Dsl::EditField do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::EditField.new(config) }

  describe ".read_only" do
    it "saves the value in the config object" do
      config.expects(:read_only=)
      subject.read_only(true)
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

