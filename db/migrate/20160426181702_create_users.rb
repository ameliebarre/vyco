class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :pseudo
      t.string :mail
      t.integer :id_album
      t.integer :id_playlist

      t.timestamps null: false
    end
  end
end
