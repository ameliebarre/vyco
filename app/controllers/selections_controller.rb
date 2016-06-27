class SelectionsController < ApplicationController
   authorize_resource
   before_action :authenticate_user!
   before_action :set_selection, only: [:show, :edit, :update, :destroy]
   before_action :display_playlists

   def index
      @selections = Selection.all
   end

   def show
   end

   def new
      @selection = Selection.new
   end

   def edit
   end

   def create
      @selection = Selection.new(selection_params)

      if @selection.save
         redirect_to selections_url
      else
         render :new
      end
   end

   def update
      if @selection.update(selection_params)
         redirect_to @selection
      else
         render :edit
      end
   end

   def destroy
      @selection.destroy
      redirect_to selections_url
   end

   private
      def set_selection
         @selection = Selection.find(params[:id])
      end

      def selection_params
         params.require(:selection).permit(:name, :avatar)
      end
end
