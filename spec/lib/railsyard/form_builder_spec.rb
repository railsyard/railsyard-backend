require 'spec_helper'
require 'railsyard/form_builder'

describe Railsyard::FormBuilder do

  subject do
    Railsyard::FormBuilder.new(stub_everything, stub_everything, stub_everything, stub_everything, stub_everything)
  end

  describe ".translate" do
    it "lookups by action name and model name (also using defaults)" do
      subject.stubs(:lookup_action).returns(:new)
      subject.stubs(:lookup_model_names).returns([:model])
      translation = stub
      I18n.stubs(:t).with(
        :"model.new.main",
        scope: :"railsyard.groups",
        default: [
          :"model.main",
          :"defaults.new.main",
          :"defaults.main",
          'default'
        ]
      ).returns(translation)
      subject.translate(:groups, :main, 'default').should == translation
    end
  end


  describe ".group", type: :view do
    helper SimpleForm::ActionViewExtensions::FormHelper
    helper BackendHelper

    before do
      view.stubs(:book_path).returns("#")
    end
    let(:resource) { stub_model(Book) }
    let(:template) do
      <<-EOTEMPLATE
        <%= backend_form_for(resource) do |f| %>
          <%= f.group(:main) do %>
          <% end %>
        <% end %>
      EOTEMPLATE
    end

    it "should add a div with data-behaviour" do
      render(:inline => template, :locals => { :resource => resource })
      rendered.should have_xpath("//div[@data-behaviour='groups-toggle']")
    end

    it "should add a empty header" do
      render(:inline => template, :locals => { :resource => resource })
      rendered.should have_xpath("//h3[@data-behaviour='groups-toggle']/a") do |a|
        a.should_not have_content # FIXME: never executed?
      end
    end

    it "should not add hint" do
      render(:inline => template, :locals => { :resource => resource })
      rendered.should_not have_xpath("//div[@data-behaviour='groups-toggle']/p[@class='hint']")
    end

    context "with proper translations" do

      it "should add a header" do
        store_translations(:en, railsyard: { groups: { book: { main: "FOO" } } }) do
          render(:inline => template, :locals => { :resource => resource })
          rendered.should have_xpath("//h3[@data-behaviour='groups-toggle']/a[text()='FOO']")
        end
      end

      it "should add a hint" do
        store_translations(:en, railsyard: { group_hints: { book: { main: "FOO" } } }) do
          render(:inline => template, :locals => { :resource => resource })
          rendered.should have_xpath("//div[@data-behaviour='groups-toggle']/p[@class='hint' and text()='FOO']")
        end
      end

    end

  end

end
