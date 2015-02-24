class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :sell_id
      t.integer :product_id
      t.integer :value
      t.integer :quantity

      t.timestamps
    end
  end
end
