class AddPositionToBooks < ActiveRecord::Migration
  def change
    add_column :books, :position, :integer
  end
end
