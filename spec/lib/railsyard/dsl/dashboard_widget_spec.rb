require 'spec_helper'

describe Railsyard::Dsl::DashboardWidget do

  let(:config) { stub }
  subject { Railsyard::Dsl::DashboardWidget.new(config) }

  it "converts each method called to a setting for the config" do
    config.expects(:"[]=").with(:foo, true)
    subject.foo(true)
  end

end

