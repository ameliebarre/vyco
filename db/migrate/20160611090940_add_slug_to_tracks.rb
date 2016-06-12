class AddSlugToTracks < ActiveRecord::Migration
   def change
      add_column :tracks, :slug, :string, unique: true, index: true
   end
end
