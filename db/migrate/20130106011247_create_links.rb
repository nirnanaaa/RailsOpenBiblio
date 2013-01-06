class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :label
      t.string :url
      t.text :tooltip
      t.references :book

      t.timestamps
    end
    add_index :links, :book_id
  end
end
