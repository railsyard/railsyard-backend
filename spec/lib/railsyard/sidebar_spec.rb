require 'spec_helper'

describe Railsyard::Backend do

  describe ".define_sidebar" do

    it "should set a sidebar" do
      Railsyard::Backend.define_sidebar
      Railsyard::Backend.sidebar.        should     be_a Railsyard::Backend::Config::Sidebar
    end

  end


  context "integration" do

    it "saves the whole DSL configuration tree properly" do

      Railsyard::Backend.define_sidebar do

        group :first
        group :second

      end

      config = Railsyard::Backend.sidebar

      config.groups.                     should     have( 2 ).groups
      config.group(:first).              should_not be_nil
    end

  end

end

