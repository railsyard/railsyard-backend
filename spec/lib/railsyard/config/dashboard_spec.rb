require 'spec_helper'

describe Railsyard::Backend::Config::Dashboard do

  it "lets you add new columns, and get them back via .columns" do
    first_column = stub
    second_column = stub
    subject.add_column(first_column)
    subject.add_column(second_column)
    subject.columns.should == [ first_column, second_column ]
  end

end
