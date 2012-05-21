require 'spec_helper'

describe Railsyard::Backend::Dsl::List do

  let(:config) { stub }
  subject { Railsyard::Backend::Dsl::List.new(config) }

  describe ".field" do
    it "initialize a Config::ListField and adds it to config" do
      field_config = stub
      Railsyard::Backend::Config::ListField.stubs(:new).with(:foo).returns(field_config)
      config.expects(:add_field).with(field_config)
      subject.field(:foo)
    end
  end

  describe ".as_tree" do
    it "configs sorting_type to :tree" do
      config.expects(:sorting_attribute=).with(:foo)
      config.expects(:sorting_type=).with(:tree)
      subject.as_tree(using: :foo)
    end
  end

  describe ".sortable" do
    it "configs sorting_type to :simple" do
      config.expects(:sorting_attribute=).with(:foo)
      config.expects(:sorting_type=).with(:simple)
      subject.sortable(using: :foo)
    end
  end

  describe ".paginates" do
    it "accepts the :per parameter, and forwards it to .page_size= config" do
      config.expects(:page_size=).with(50)
      subject.paginates(per: 50)
    end
  end

  describe ".searchable" do
    it "accepts the :with_scope parameter, and forwards it to .search_scope= config" do
      config.expects(:search_scope=).with(:search)
      subject.searchable(with_scope: "search")
    end
  end

end
