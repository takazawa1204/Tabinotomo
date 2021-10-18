class FavoritesController < ApplicationController
   before_action :authenticate_user!
  
  def create
    @itenerary = Itenerary.find(params[:itenerary_id])
    favorite = current_user.favorites.new(itenerary_id: @itenerary.id)
    favorite.save
    # redirect_to iteneraries_path
  end


  def destroy
    @itenerary = Itenerary.find(params[:itenerary_id])
    favorite = current_user.favorites.find_by(itenerary_id: @itenerary.id)
    favorite.destroy
    # redirect_to iteneraries_path
  end


end
