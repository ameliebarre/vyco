class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :pseudo
      t.string :password
      t.string :mail
      t.integer :id_album

      t.timestamps null: false
    end
  end
end
