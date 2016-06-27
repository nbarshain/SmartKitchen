class ChangeQuantityToFloatInFood < ActiveRecord::Migration
  def change
  	change_column :foods, :quantity, :float
  end
end
