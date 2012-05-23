require 'spec_helper'

describe Railsyard::Backend::Config::DashboardGroup do

  subject { Railsyard::Backend::Config::DashboardGroup.new(:lol) }

  it "takes a name" do
    subject.name.should == :lol
  end

  it "lets you add widgets of any type, and get them back via .widget and .widgets" do
    model = stub(name: "Foo")
    widget = stub(model_class: model, type: :instance)
    subject.add_widget(widget)
    subject.widgets.should have(1).widget
    subject.widgets.first.should == widget
    subject.widget(model).should == widget
  end

end
