class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistance_token
      t.string :single_access_token
      t.string :perishable_token
      t.integer :login_count
      t.integer :failed_login_count
      t.datetime :last_requested_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip
      
      t.references :books
      t.references :authors
      t.references :genres
      
      t.timestamps
    end
    add_index :users, :books_id
    add_index :users, :authors_id
    add_index :users, :genres_id
  end
end
