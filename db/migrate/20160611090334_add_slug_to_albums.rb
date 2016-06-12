class AddSlugToAlbums < ActiveRecord::Migration
   def change
      add_column :albums, :slug, :string, unique: true, index: true
   end
end
