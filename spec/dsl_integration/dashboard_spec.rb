require 'spec_helper'

describe "Dashboard DSL" do

  it "saves the whole DSL configuration tree properly" do

    config = Railsyard::Config::Dashboard.new do
      column do
        widget :analytics_line_chart, :last_week_visits do
          username "mickey"
          password "mouse"
          metric :visits
          start_date Date.new(2012, 1, 1)
          end_date Date.new(2012, 10, 1)
        end
        widget :list_item, :latest_comments do
          count 5
          order_by :created_at
        end
      end
    end

    config.columns.should have(1).column
    column = config.columns.first

    column.widgets.should have(2).widgets

    line_chart = column.widgets.first
    line_chart.type.should == :analytics_line_chart
    line_chart.name.should == :last_week_visits
    line_chart[:username].should == "mickey"
    line_chart[:end_date].should == Date.new(2012, 10, 1)
  end

end

