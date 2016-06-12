class ApplicationController < ActionController::Base

   before_action :display_playlists

   protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
     flash[:error] = exception.message
     if request.env['HTTP_REFERER'].present?
        redirect_to :back
     else
        redirect_to root_path
     end
  end

  def index
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

   protected
      def display_playlists
         @playlists = Playlist.all
      end

end
