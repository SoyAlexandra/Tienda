class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :doc_type
      t.string :doc
      t.string :name
      t.string :email

      t.timestamps
    end
  
  end


end
