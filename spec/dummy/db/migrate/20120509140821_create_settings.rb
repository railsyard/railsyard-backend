class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :footer

      t.timestamps
    end
  end
end
