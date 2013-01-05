class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :username_clean
      t.text :description
      t.string :password
      t.string :salt
      t.string :confirmation
      t.integer :born
      t.string :location
      t.string :website
      t.references :tags
      t.references :books

      t.timestamps
    end
    add_index :users, :tags_id
    add_index :users, :books_id
  end
end
