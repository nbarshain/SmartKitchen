class AddFieldsToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :quantity, :integer
    add_column :foods, :weight, :float
  end
end
