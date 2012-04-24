require 'spec_helper'

describe Railsyard::Plugin::Config do

  %w(name backend_js_dependencies backend_css_dependencies).each do |attr|
    it "let get and set :#{attr} attribute" do
      subject.send("#{attr}=", :foo)
      subject.send(attr).should == :foo
    end
  end

end
