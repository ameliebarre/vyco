class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :picture

      t.timestamps null: false
    end
  end
end
