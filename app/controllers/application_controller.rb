class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
     @playlists = Playlist.all
  end

  def show
  end

  def new
     @playlist = Playlist.new
  end

  def create
  end

  private
     def playlist_params
        params.require(:playlist).permit(:name, :id_user)
     end

end
