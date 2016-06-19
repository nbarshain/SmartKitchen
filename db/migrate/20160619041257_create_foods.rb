class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
    	t.string :name
    	t.integer :quantity
    	t.single :weight
    	t.references :cabinet, index: true, foreign_key: true

    	t.timestamps null: false
    end
  end
end
