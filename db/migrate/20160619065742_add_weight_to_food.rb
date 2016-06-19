class AddWeightToFood < ActiveRecord::Migration
  def change
    add_column :foods, :weight, :single
  end
end
