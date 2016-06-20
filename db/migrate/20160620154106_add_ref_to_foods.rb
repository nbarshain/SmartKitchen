class AddRefToFoods < ActiveRecord::Migration
  def change
    add_reference :foods, :cabinet, index: true, foreign_key: true
  end
end
