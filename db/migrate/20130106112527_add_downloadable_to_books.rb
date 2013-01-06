class AddDownloadableToBooks < ActiveRecord::Migration
  def change
    add_column :books, :downloadable, :boolean
  end

end