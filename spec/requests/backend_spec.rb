require 'spec_helper'

feature "Backend" do
  scenario "Backend exists!" do
    visit "/static"
    page.should have_content "FOOO"
  end
end
