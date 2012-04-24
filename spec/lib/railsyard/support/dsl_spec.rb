require 'spec_helper'

describe Railsyard::Backend::Support::Dsl do

  let(:config) { stub }
  subject { Railsyard::Backend::Support::Dsl.new(config) }

  it "takes a config to fill" do
    subject
  end

  describe "#delegate_to_config" do

    before do
      class FooBar < Railsyard::Backend::Support::Dsl
        delegate_to_config :foo, :foo=
      end
    end

    let(:config) { stub }
    subject { FooBar.new(config) }

    it "assigns the passed values to a method in the config object" do
      config.expects(:foo=).with(:param)
      subject.foo(:param)
    end

    it "assigns the passed block, if present" do
      config.expects(:foo=).with { |val| val.is_a? Proc }
      subject.foo { true }
    end

  end

end

