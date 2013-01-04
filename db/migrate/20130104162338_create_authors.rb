class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
	  t.integer :author_id
      t.string :name
      t.text :biography
      t.integer :born
      t.integer :died
      t.integer :books

      t.timestamps
    end
  end
end
