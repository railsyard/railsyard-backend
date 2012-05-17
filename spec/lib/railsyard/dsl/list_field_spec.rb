require 'spec_helper'

describe Railsyard::Backend::Dsl::ListField do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::ListField.new(config) }

  describe ".format_as" do
    it "forwards the value to .format= config" do
      config.expects(:format=)
      subject.format_as(true)
    end
  end

end

