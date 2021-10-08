class ItenerariesController < ApplicationController
  def new
    @itenerary = Itenerary.new
    @belonging = @itenerary.belongings.build
    @schedule = @itenerary.schedules.build
    @album = @itenerary.albums.build

  end

  def create
    @itenerary = Itenerary.new(itenerary_params)
    @itenerary.save
    redirect_to iteneraries_path
    tag_list = params[:tag_name].split(",")
    if @itenerary.save
      @itenerary.save_albums(tag_list)
    end
  end

  def index
    @iteneraries = Itenerary.all
  end

  def show
    @itenerary = Itenerary.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def itenerary_params
    params.require(:itenerary).permit(:title, :edit_password, belongings_attributes: [:id, :belongings_name, :_destroy], schedules_attributes: [:id, :schedules_date, :schedules_time, :schedules_title, :schedules_comment, :_destroy], albums_attributes: [:id, :image, :albums_comment, :albums_map, :_destroy])
  end
end