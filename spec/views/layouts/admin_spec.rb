require 'spec_helper'

describe "layouts/railsyard/admin" do
  it "includes additional assets coming from plugins" do
    Railsyard.plugin_manager.add_plugin(:foo) do
      backend_javascript_dependency "dep"
      backend_stylesheet_dependency "dep"
    end
    render
    rendered.should have_xpath("//script[@src='/assets/dep.js']")
    rendered.should have_xpath("//link[@href='/assets/dep.css']")
  end
end
