class StylesController < ApplicationController
   authorize_resource
   before_action :authenticate_user!
   before_action :set_style, only: [:show, :edit, :update, :destroy]

   def index
      @playlists = Playlist.all
      @styles = Style.all
   end

   def show
   end

   def new
      @playlists = Playlist.all
      @style = Style.new
   end

   def edit
      @playlists = Playlist.all
   end

   def create
      @style = Style.new(style_params)

      if @style.save
         redirect_to @style, notice: 'The musical style was successfully created.'
      else
         render :new
      end
   end

   def update
       if @style.update(style_params)
          redirect_to @style, notice: 'The musical style was successfully updated.'
       else
          render :edit
       end
   end

   def destroy
     @style.destroy
     redirect_to styles_url, notice: 'The musical style was successfully destroyed.'
   end

   private
     def set_style
       @style = Style.find(params[:id])
     end

     def style_params
       params.require(:style).permit(:name, :avatar)
     end

end
