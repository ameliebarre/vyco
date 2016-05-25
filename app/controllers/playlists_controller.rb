class PlaylistsController < ApplicationController
   authorize_resource
   before_action :authenticate_user!
   before_action :set_playlist, only: [:show, :edit, :update, :destroy]

   def index
      @playlists = Playlist.all
   end

   def show
   end

   def new
      @playlists = Playlist.all
      @playlist = Playlist.new
   end

   def edit
      @playlists = Playlist.all
   end

   def create
      playlist_params[:id_user] = current_user.id
      @playlist = Playlist.new(playlist_params)

      if @playlist.save
         redirect_to root_path, notice: 'Playlist was successfully created.'
      else
         render :new
      end
   end

   def update
      if @playlist.update(playlist_params)
         redirect_to @playlist, notice: 'Playlist was successfully updated.'
      else
         render :edit
      end
   end

   def destroy
      @playlist.destroy
      redirect_to playlists_url, notice: 'Playlist was successfully destroyed.'
   end

   private
      def set_playlist
         @playlist = Playlist.find(params[:id])
      end

      def playlist_params
         params.require(:playlist).permit(:name, :id_user)
      end
end
