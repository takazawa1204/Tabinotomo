class AlbumsController < ApplicationController
  def creat
    @itenerary = Itenerary.find(params[:itenerary_id])
    @album = @itenerary.albums.new(album_params)
    @album.itenerary_id = itenerary.id
    @album.save
    redirect_to new_itenerary_path
    tag_list = params[:tag_name].split(",")
    if @album.save
      @album.save_albums(tag_list)
    end
  end

  def destroy
  end

  def index
  end

  def edit
    @tag_list = @album.tags.pluck(:tag_name).join(",")
  end

  def update
    tag_list = params[:album][:tag_name].split(",")
    respond_to do |format|
      if @album.update(album_params)
        @album.save_albums(tag_list)
      end
    end
  end

  private

  def album_params
    params.require(:belonging).permit(:image, :albums_comment, :albums_map, :itenerary_id)
  end
end
