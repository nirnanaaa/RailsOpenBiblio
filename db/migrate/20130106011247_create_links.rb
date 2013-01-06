class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :label
      t.string :url
      t.text :tooltip
      t.references :books

      t.timestamps
    end
    add_index :links, :books_id
  end
end
