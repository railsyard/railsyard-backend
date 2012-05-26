require 'spec_helper'

describe Railsyard::Backend::Plugin::Config do

  %w(name backend_js_dependencies backend_css_dependencies).each do |attr|
    it "lets get and set :#{attr} attribute" do
      subject.send("#{attr}=", :foo)
      subject.send(attr).should == :foo
    end
  end

  it "lets you retrieve generator_editor_types with name" do
    type = {name: :my_awesome_plugin, ar_type: :text, editor_options: "as: :triple_rainbow"}
    subject.add_generator_editor_type :my_awesome_plugin, :text, "as: :triple_rainbow"
    subject.generator_editor_type("my_awesome_plugin").should == type
  end

end
