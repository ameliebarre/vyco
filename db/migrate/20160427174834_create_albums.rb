class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.date :date_release
      t.string :style
      t.integer :id_artist

      t.timestamps null: false
    end
  end
end
