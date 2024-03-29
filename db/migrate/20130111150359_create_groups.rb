class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.references :users

      t.timestamps
    end
    add_index :groups, :users_id
  end
end
