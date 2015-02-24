class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.integer :total
      t.text :comment

      t.timestamps
    end
  end
end
