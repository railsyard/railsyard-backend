require 'spec_helper'
require 'erb'

describe Railsyard::Generators::EditorGenerator do
  include GeneratorSpec::TestCase
  root_path = File.expand_path("../../../../", __FILE__)
  destination File.join(root_path, "tmp/spec")
  templates = ActionView::Base.new File.join(root_path, "lib/generators/railsyard/templates")

  arguments %w(Narwhal title:string:uniq body:text)

  before :all do
    prepare_destination
    run_generator
    templates.assign(class_name: "Narwhal",
                     fields: [{name: "title", editor_config: "field :title"},
                              {name: "body", editor_config: "field :body"} ])
  end

  after(:all) { `rm -rf #{destination_root}` }

  it "creates a editor file" do
    editor_content = templates.render(template: 'editor_for_resource.rb.erb')
    assert_file "app/backend/editor_for_narwhal.rb", editor_content
  end

  it "creates a rails model" do
    assert_file "app/models/narwhal.rb"
  end

  it "creates a rails migration" do
    assert_migration "db/migrate/create_narwhals.rb"
  end

end
