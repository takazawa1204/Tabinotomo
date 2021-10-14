class AlbumsController < ApplicationController
  def creat
    @itenerary = Itenerary.find(params[:itenerary_id])
    @album = @itenerary.albums.new(album_params)
    @album.itenerary_id = itenerary.id
    @album.save
    redirect_to new_itenerary_path
  end

  def destroy
  end

  def index
  end

  def edit
  end

  def update
  end

  private

  def album_params
    params.require(:album).permit(:image, :albums_comment, :albums_map, :itenerary_id)
  end
end
