class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
	  t.integer :book_id
      t.string :name
      t.text :description
	  t.integer :release
	  t.integer :isbn
	  t.integer :available
	  t.text :kind
	  t.text :slogan

	  
	  t.references :location
      t.references :author
      t.references :genre
	
      t.timestamps
    end
	add_index :books, :location_id
    add_index :books, :author_id
    add_index :books, :genre_id
  end
end
