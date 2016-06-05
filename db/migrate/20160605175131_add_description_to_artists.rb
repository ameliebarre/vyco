class AddDescriptionToArtists < ActiveRecord::Migration
   def self.up
     change_table :artists do |t|
       t.string :description
     end
   end
end
