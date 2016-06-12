class TracksController < ApplicationController
   authorize_resource
   before_action :set_track, only: [:show, :edit, :update, :destroy]
   before_action :display_playlists

   def index
      @tracks = Track.all
   end

   def show
   end

   def new
      @track = Track.new
   end

   def edit
  end

   def create
      @track = Track.new(track_params)

      if @track.save
         redirect_to @track, notice: 'Track was successfully created.'
      else
         render :new
      end
   end

  def update
      if @track.update(track_params)
         redirect_to @track, notice: 'Track was successfully updated.'
      else
         render :edit
      end
  end

  def destroy
     @track.destroy
     redirect_to tracks_url, notice: 'Track was successfully destroyed.'
  end

  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:name, :path, :track_file, :album_id)
    end
end
