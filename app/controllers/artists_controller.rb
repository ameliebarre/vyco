class ArtistsController < ApplicationController
   authorize_resource
   before_action :set_artist, only: [:show, :edit, :update, :destroy]

   def index
      @playlists = Playlist.all
      @artists = Artist.all

      if params[:artists]
         @search_value = search_params[:search]
         @artists = @artists.search(@search_value)
      end
   end

   def show
   end

   def new
     @playlists = Playlist.all
     @artist = Artist.new
  end

  def edit
     @playlists = Playlist.all
  end

  def create
      @artist = Artist.new(artist_params)

      if @artist.save
        redirect_to @artist, notice: 'Artist was successfully created.'
      else
        render :new
      end
  end

  def update
      if @artist.update(artist_params)
        redirect_to @artist, notice: 'Artist was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @artist.destroy
    redirect_to artists_url, notice: 'Artist was successfully destroyed.'
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :firstname, :avatar, :description, album_ids: [])
    end

    def search_params
      params.require(:artists).permit(:search)
    end
end
