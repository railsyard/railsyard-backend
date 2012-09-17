require 'spec_helper'

describe Railsyard::Dsl::EditField do

  let(:config) { stub }
  subject { Railsyard::Dsl::EditField.new(config) }

  delegated_options = {
    visible: :visible=,
    input_options: :input_options=
  }

  delegated_options.each do |method, config_method|
    describe ".#{method}" do
      it "saves the passed value to the .#{config_method} config method" do
        config.expects(config_method).with(true)
        subject.public_send(method, true)
      end
      it "saves the passed block to the .#{config_method} config method" do
        config.expects(config_method).with { |arg| arg.is_a? Proc }
        subject.public_send(method) do
          true
        end
      end
    end
  end

end

