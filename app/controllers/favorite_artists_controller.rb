class FavoriteArtistsController < ApplicationController
  before_action :set_artist

  def create
    if Favorite.create(favorited: @artist, user: current_user)
      redirect_to @artist
    else
      redirect_to @artist
    end
  end

  def destroy
    Favorite.where(favorited_id: @artist.id, user_id: current_user.id).first.destroy
    redirect_to @artist
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id] || params[:id])
  end

end
