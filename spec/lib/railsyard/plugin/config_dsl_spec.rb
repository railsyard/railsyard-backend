require 'spec_helper'

describe Railsyard::Backend::Plugin::ConfigDsl do

  let(:config) do
    stub(backend_js_dependencies: [],
         backend_css_dependencies: [])
  end
  subject { Railsyard::Backend::Plugin::ConfigDsl.new(config) }

  describe '.backend_javascript_dependency' do
    it "adds a path to asset js paths" do
      expect do
        subject.backend_javascript_dependency "my/awesome/plugin/js"
      end.to change(config, :backend_js_dependencies).from([]).to(["my/awesome/plugin/js"])
    end
  end

  describe '.backend_css_dependencies' do
    it "adds a path to asset css paths" do
      expect do
        subject.backend_stylesheet_dependency "my/awesome/plugin/css"
      end.to change(config, :backend_css_dependencies).from([]).to(["my/awesome/plugin/css"])
    end
  end

  describe '.generator_editor_types' do
    it "adds a new type for editor generator" do
      config.expects(:add_generator_editor_type).with(:my_awesome_plugin, :text, "as: :triple_rainbow")
      subject.generator_editor_type :my_awesome_plugin, :text, "as: :triple_rainbow"
    end
  end

end
