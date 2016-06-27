class PlaylistsController < ApplicationController
   authorize_resource
   before_action :authenticate_user!
   before_action :set_playlist, only: [:show, :edit, :update, :destroy]
   before_action :display_playlists

   def index
      @playlists = Playlist.all
   end

   def show
   end

   def new
      @playlist = Playlist.new
   end

   def edit
   end

   def create
      playlist_params[:user_id] = current_user.id
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
         params.require(:playlist).permit(:name, :user_id)
      end
end
