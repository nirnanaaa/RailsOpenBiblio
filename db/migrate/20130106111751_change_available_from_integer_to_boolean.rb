class ChangeAvailableFromIntegerToBoolean < ActiveRecord::Migration
  def self.up
   change_column :books, :available, :boolean
  end

  def self.down
   change_column :books, :available, :integer
  end
end
