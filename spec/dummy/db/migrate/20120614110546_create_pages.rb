class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :subtitle
      t.integer :parent_id
      t.timestamps
    end
  end
end
