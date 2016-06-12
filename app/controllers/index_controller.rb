class IndexController < ApplicationController
   before_action :authenticate_user!
   before_action :display_playlists

end
