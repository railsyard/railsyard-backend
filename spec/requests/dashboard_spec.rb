require 'spec_helper'

feature "Backend" do

  scenario "Sidebar is correctly shown" do
    # When I visit any page (ie. the Dashboard)
    visit "/backend"

    within "#page-sidebar nav" do
      # Then in the siderbar should be present the groups specified in the sidebar.rb config
      page.should have_xpath ".//h3[text() = 'Settings']"
      page.should have_xpath ".//h3[text() = 'Links']"

      # And for each group should be present the links specified
      page.should have_xpath ".//ul[@class='group'][1]/li/a[text() = 'Books']"
      page.should have_xpath ".//h3[text() = 'Settings']/following-sibling::ul/li/a[text() = 'Settings']"
      page.should have_xpath ".//h3[text() = 'Links']/following-sibling::ul/li/a[text() = 'Railsyard']"
    end
  end

  scenario "Dashboard widgets are properly rendered" do
    # When I visit the Dashboard
    visit "/backend"

    within "section.dashboard-widgets" do
      # Then I should see two columns
      page.should have_selector(".colspan3", count: 2)

      # And within the first column
      within ".colspan3" do
        # I should have an "Hello World" widget
        page.should have_xpath(".//h3[text() = 'Hello World']")
        # And I should have a "Mickey Mouse" content
        page.should have_xpath(".//h4[text() = 'Mickey Mouse']")
      end

    end

  end

end
