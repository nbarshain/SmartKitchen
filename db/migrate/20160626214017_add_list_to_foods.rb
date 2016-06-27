class AddListToFoods < ActiveRecord::Migration
  def change
    add_reference :foods, :list, index: true, foreign_key: true
  end
end
