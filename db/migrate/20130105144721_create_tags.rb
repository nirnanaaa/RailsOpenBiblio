class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.text :description
      t.references :books

      t.timestamps
    end
    add_index :tags, :books_id
  end
end
