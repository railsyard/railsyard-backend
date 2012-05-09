require 'spec_helper'

feature "CRUD for instances" do

  scenario "Instance editing" do
    # When I visit the edit action for global settings
    visit "/backend/settings/edit"

    # Then the title should be "Edit Settings"
    page.should have_content "Edit Settings"

    # And I fill in the form with new settings
    fill_in "Footer", with: "Foo"
    click_on "Update Settings"

    # Then the settings should be updated
    Settings.instance.reload
    Settings.instance.footer.should == "Foo"

    # And a success message should appear
    page.should have_notice "Settings was successfully updated."
  end

end
