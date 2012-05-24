require 'spec_helper'

describe Railsyard::Backend::Config::DashboardColumn do

  it "lets you add widgets of any type, and get them back via .widgets" do
    first_widget = stub
    second_widget = stub
    subject.add_widget(first_widget)
    subject.add_widget(second_widget)
    subject.widgets.should == [ first_widget, second_widget ]
  end

end
