require 'spec_helper'

feature "One to one relationships" do

  scenario "Resource creation", js: true do
    # When I visit the new action for Book models
    visit "/backend/books/new"

    save_and_open_page

    # Then there should be a button to add an Author
    page.should have_selector ".add_nested_fields[data-association='book_author']"

    # When I click on that
    find(".add_nested_fields[data-association='book_author']").click

    # Then there should not be a button to add another Author
    page.find(".add_nested_fields[data-association='book_author']").should_not be_visible
  end

  scenario "One to one relationships, editing", js: true do
    # Given I have a book model with an author
    book = create(:book)
    book.author = create(:author)

    # When I visit the edit action for the model
    visit "/backend/books/#{book.to_param}/edit"

    # Then there should not be a button to add another Author
    page.find(".add_nested_fields[data-association='book_author']").should_not be_visible

    # When I remove the existing author
    find(".remove_nested_fields[data-association='book_author']").click
    accept_alert

    save_and_open_page
    # Then there should be a button to add an Author
    page.should have_selector ".add_nested_fields[data-association='book_author']"
  end
end
