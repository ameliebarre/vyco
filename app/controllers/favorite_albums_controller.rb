class FavoriteAlbumsController < ApplicationController
  before_action :set_album

  def create
    if Favorite.create(favorited: @album, user: current_user)
      redirect_to @album, notice: 'Album has been favorited'
    else
      redirect_to @album, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    Favorite.where(favorited_id: @album.id, user_id: current_user.id).first.destroy
    redirect_to @album, notice: 'Album is no longer in favorites'
  end

  private

  def set_album
    @album = Album.find(params[:album_id] || params[:id])
  end
end
