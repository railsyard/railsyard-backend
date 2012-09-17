require 'spec_helper'

describe Railsyard::Dsl::ListField do

  let(:config) { stub }
  subject { Railsyard::Dsl::ListField.new(config) }

  describe ".format_as" do
    it "forwards the value to .formatter= config" do
      config.expects(:formatter=)
      subject.format_as(true)
    end
  end

end

