class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
	  t.integer :release
	  t.text :kind
	  t.text :slogan
	  t.integer :isbn
	  t.integer :available
	  
	  t.references :locations
      t.references :authors
      t.references :genres
	
      t.timestamps
    end
	add_index :books, :locations_id
    add_index :books, :authors_id
    add_index :books, :genres_id
  end
end
