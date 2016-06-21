class AddKitchenToCabinets < ActiveRecord::Migration
  def change
    add_reference :cabinets, :kitchen, index: true, foreign_key: true
  end
end
