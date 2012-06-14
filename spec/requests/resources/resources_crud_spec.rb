require 'spec_helper'

feature "CRUD for resources" do

  scenario "List resources" do
    # Given I have 10 books
    books = create_list(:book, 10)

    # When I visit the list action for Book models
    visit "/backend/books"

    # Then the first 5 books should be properly listed
    page.should have_content "List Books"
    books[0...5].each do |book|
      page.should have_selector dom_id_for(book)
    end

    # And there should be 2 pages of results
    within "nav.pagination" do
      page.should have_selector("span.page", count: 2)
    end
  end

  scenario "Resource creation" do
    # When I visit the new action for Book models
    visit "/backend/books/new"

    # Then the title should be "New Book"
    page.should have_content "New Book"

    # And I fill in the form with a book data
    fill_in "Title", with: "Foo"
    fill_in "Subtitle", with: "Bar"
    fill_in "Description", with: "Desc"
    click_on "Create Book"

    # Then a new book should be created with the same data
    book = Book.first
    book.should_not be_nil
    book.title.should == "Foo"
    book.subtitle.should == "Bar"
    book.description.should == "Desc"

    # And a success message should appear
    page.should have_notice "Book was successfully created."
  end

  scenario "Resource editing" do
    # Given I have a book model
    book = create(:book)

    # When I visit the edit action for the model
    visit "/backend/books/#{book.to_param}/edit"

    # Then the title should be "Edit Book"
    page.should have_content "Edit Book"

    # And I fill in the form with a book data
    fill_in "Title", with: "Foo"
    fill_in "Subtitle", with: "Bar"
    fill_in "Description", with: "Desc"
    click_on "Update Book"

    # Then the book should be updated
    book.reload
    book.title.should == "Foo"
    book.subtitle.should == "Bar"
    book.description.should == "Desc"

    # And a success message should appear
    page.should have_notice "Book was successfully updated."
  end

  scenario "Resource removal" do
    # Given I have a book model
    book = create(:book)

    # When I visit the list action for Book models
    visit "/backend/books"

    # Within the list item for the book itself
    within dom_id_for(book) do
      # The button label should be "Delete Book"
      page.should have_content "Delete Book"
      # When I click on the Delete button
      find_rel("delete-resource").click
    end

    # Then the book should have been deleted
    book.should_not exist_in_database

    # And a success message should appear
    page.should have_notice "Book was successfully destroyed."
  end

  scenario "Search" do
    # Given I have a "Foo" book model
    first_book = create(:book, title: "Foo")
    # And I have a "Bar" book model
    second_book = create(:book, title: "Bar")

    # When I visit the list action for Book models
    visit "/backend/books"
    # And I search for "foo"
    fill_in "query", with: "foo"
    # And I run the search
    click_on "Search"

    # Then I should be redirected on the same page
    page.should have_content "List Books"

    # And I should only see the "Foo" book
    page.should have_selector dom_class_for(first_book), count: 1
    page.should have_selector dom_id_for(first_book)
  end

  pending "Nested resources"
  pending "Errors gets printed out"
  pending "Export works"

end
