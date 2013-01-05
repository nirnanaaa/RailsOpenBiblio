class AddFullnameToBook < ActiveRecord::Migration
  def change
    add_column :books, :fullname, :string
  end

end