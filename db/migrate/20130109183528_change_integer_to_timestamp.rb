class ChangeIntegerToTimestamp < ActiveRecord::Migration
  def up
   change_column :books, :release, :datetime
   change_column :authors, :born, :datetime
   change_column :authors, :died, :datetime
  end

  def down
   change_column :books, :release, :timestamp
   change_column :authors, :born, :timestamp
   change_column :authors, :died, :timestamp
  end
end
