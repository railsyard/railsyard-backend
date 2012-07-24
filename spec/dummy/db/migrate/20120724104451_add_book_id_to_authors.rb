class AddBookIdToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :book_id, :integer
  end
end
