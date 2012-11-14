class RenameColumnAvailabilityToAvailableInProducts < ActiveRecord::Migration
  def up
  	rename_column :products, :availability, :available
  end

  def down
  	rename_column :products, :available, :availability
  end
end
