class IndexController < ApplicationController
   before_action :authenticate_user!
   before_action :display_playlists

   def index
      @fav_artists = current_user.favorite_artists.order(:created_at).limit(6)
      @fav_albums = current_user.favorite_albums.order(:created_at).limit(6)
      @user_playlists = Playlist.limit(6)
   end

end
