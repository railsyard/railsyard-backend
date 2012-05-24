require 'spec_helper'

feature "Backend" do

  scenario "Backend exists!" do
    visit "/backend"
    page.should have_content "Dashboard"
  end

  scenario "Sidebar is correctly shown" do
    # When I visit any page (ie. the Dashboard)
    visit "/backend"

    within "#page-sidebar nav" do
      # Then in the siderbar should be present the groups specified in the sidebar.rb config
      page.should have_xpath ".//h3[text() = 'Resources']"
      page.should have_xpath ".//h3[text() = 'Settings']"
      page.should have_xpath ".//h3[text() = 'Links']"

      # And for each group should be present the links specified
      page.should have_xpath ".//h3[text() = 'Resources']/following-sibling::ul/li/a[text() = 'Books']"
      page.should have_xpath ".//h3[text() = 'Settings']/following-sibling::ul/li/a[text() = 'Settings']"
      page.should have_xpath ".//h3[text() = 'Links']/following-sibling::ul/li/a[text() = 'Railsyard']"
    end
  end

end
