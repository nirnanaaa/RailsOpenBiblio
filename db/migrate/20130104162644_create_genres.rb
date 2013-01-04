class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.text :description
      t.references :author

      t.timestamps
    end
    add_index :genres, :author_id
  end
end
