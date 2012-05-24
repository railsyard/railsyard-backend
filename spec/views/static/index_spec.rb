require 'spec_helper'

describe "railsyard/static/index" do

  it "it does not throw errors if it the dashboard has no columns" do
    swap(Railsyard::Backend, dashboard: Railsyard::Backend::Config::Dashboard.new) do
      lambda { render }.should_not raise_error
    end
  end

end
