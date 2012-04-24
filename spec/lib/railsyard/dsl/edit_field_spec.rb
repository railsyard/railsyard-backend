require 'spec_helper'

describe Railsyard::Backend::Dsl::EditField do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::EditField.new(config) }

  delegated_options = {
    readonly: :readonly=,
    use_partial: :partial=,
    visible: :visible=,
    input_options: :input_options=
  }

  delegated_options.each do |method, config_method|
    describe ".#{method}" do
      it "saves the value in the config object" do
        config.expects(config_method)
        subject.public_send(method, true)
      end
    end
  end

end

