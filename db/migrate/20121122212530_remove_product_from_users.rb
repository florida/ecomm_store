class RemoveProductFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :product
  end

  def down
    add_column :users, :product, :integer
  end
end
