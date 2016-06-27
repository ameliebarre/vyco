class AlbumsController < ApplicationController
   authorize_resource
   before_action :set_album, only: [:show, :edit, :update, :destroy]
   before_action :display_playlists

   def index
      @albums = Album.all

      if params[:albums]
         @search_value = search_params[:search]
         @albums = @albums.search(@search_value)
      end
   end

   def show
   end

   def new
      @album = Album.new
   end

   def edit
   end

   def create
      @album = Album.new(album_params)

      if @album.save
         redirect_to @album, notice: 'Album was successfully created.'
      else
         render :new
      end
   end

  def update
      if @album.update(album_params)
         redirect_to @album, notice: 'Album was successfully updated.'
      else
         render :edit
      end
  end

  def destroy
    @album.destroy
    redirect_to albums_url, notice: 'Album was successfully destroyed.'
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:name, :date_release, :style, :avatar, :style_id, :artist_id, user_ids: [])
    end

    def search_params
      params.require(:albums).permit(:search)
    end
end
