require 'spec_helper'
require 'erb'

shared_examples_for "any editor generator" do |args, templates, template_variables|

  before :all do
    prepare_destination
    run_generator(args)
    templates.assign(template_variables)
  end

  after(:all) { prepare_destination }

  it "should create a editor file" do
    editor_content = templates.render(template: 'editor_for_resource.rb')
    assert_file "app/backend/editor_for_narwhal.rb", editor_content
  end

  it "should create a sidebar configuration file if not present" do
    sidebar_content = templates.render(template: 'sidebar_config.rb')
    assert_file "app/backend/sidebar_config.rb", sidebar_content
  end

  it "should create a rails model" do
    assert_file "app/models/narwhal.rb"
  end

  it "should create a rails migration" do
    assert_migration "db/migrate/create_narwhals.rb"
  end

end


describe Railsyard::Generators::EditorGenerator do
  include GeneratorSpec::TestCase
  root_path = File.expand_path("../../../../", __FILE__)
  destination File.join(root_path, "tmp/spec")
  templates = ActionView::Base.new File.join(root_path, "lib/generators/railsyard/templates")

  context "with model name, but no attributes" do
    args = %w(Narwhal)

    it_behaves_like "any editor generator",
                     args, templates, {class_name: "Narwhal", fields: []}
  end

  context "with model name and attributes without type" do
    args = %w(Narwhal title)

    it_behaves_like "any editor generator",
                    args,
                    templates,
                    {class_name: "Narwhal", fields: [{name: "title", editor_config: "field :title"}] }
  end

  context "with all possible arguments" do
    args = %w(Narwhal title:string:uniq body:text)

    it_behaves_like "any editor generator",
                    args,
                    templates,
                    {class_name: "Narwhal",
                     fields: [{name: "title", editor_config: "field :title"},
                              {name: "body", editor_config: "field :body"} ]}
  end

end
