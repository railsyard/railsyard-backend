require 'spec_helper'

describe Railsyard::Backend::Dsl::DashboardWidget do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::DashboardWidget.new(config) }

  it "converts each method called to a setting for the config" do
    config.expects(:"[]=").with(:foo, true)
    subject.foo(true)
  end

end

