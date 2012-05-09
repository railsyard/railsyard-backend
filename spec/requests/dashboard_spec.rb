require 'spec_helper'

feature "Backend" do

  scenario "Backend exists!" do
    visit "/backend"
    page.should     have_content "Dashboard"
  end

end
