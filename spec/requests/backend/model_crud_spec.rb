require 'spec_helper'

feature "Backend basic CRUD" do

  scenario "List resources" do
    # Given I have 5 books
    books = create_list(:book, 5)

    # When I visit the list action for Book models
    visit "/backend/books"

    # Then all the books should be properly listed
    page.should have_content "Index"
    books.each do |book|
      page.should have_selector dom_id_for(book)
    end
  end

  scenario "Resource creation" do
    # When I visit the new action for Book models
    visit "/backend/books/new"

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

    # And I click on the "delete" button of the book
    within dom_id_for(book) do
      find_rel("delete-resource").click
    end

    # Then the book should have been deleted
    book.should_not exist_in_database

    # And a success message should appear
    page.should have_notice "Book was successfully destroyed."
  end

end
