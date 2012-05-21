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

        group :posts do
          resource :book
          resource :author
        end

        group :settings do
          resource :user
          instance :general
          instance :pages
        end

      end

      config = Railsyard::Backend.sidebar
      config.groups.                     should     have( 2 ).groups
      config.group(:settings).           should_not be_nil

      settings_group = config.group(:settings)
      settings_group.items.              should     have( 3 ).items
      settings_group.item(:user).        should_not be_nil

      user_resource = settings_group.item(:user)
      user_resource.name.                should     == :user
      user_resource.type.                should     == :resource
    end

  end

end
