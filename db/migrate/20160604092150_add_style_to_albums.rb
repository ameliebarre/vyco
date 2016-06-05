class AddStyleToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :style, index: true, foreign_key: true
  end
end
