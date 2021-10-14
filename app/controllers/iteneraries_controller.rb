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
    redirect_to itenerary_path(@itenerary)
    tag_list = params[:itenerary][:tag_name].split(",")
    if @itenerary.save
      @itenerary.save_iteneraries(tag_list)
    end
  end

  def index
    @tag_list = Tag.all
    @iteneraries = params[:tag_id].present? ? Tag.find(params[:tag_id]).iteneraries : Itenerary.all
    @albums = Album.all
  end

  def show
    @itenerary = Itenerary.find(params[:id])
    @belongings = Belonging.where(itenerary_id: params[:id])
    @schedules = Schedule.where(itenerary_id: params[:id]).order(:schedules_date).order(:schedules_time).group_by{|schedule| schedule.schedules_date}
    @albums = Album.where(itenerary_id: params[:id])
  end

  def edit
    @itenerary = Itenerary.find(params[:id])
    @belonging = @itenerary.belongings
    @schedule = @itenerary.schedules
    @album = @itenerary.albums
    @tag_list = @itenerary.tags.pluck(:tag_name).join(",")
  end

  def update
    @itenerary = Itenerary.find(params[:id])
    @itenerary.update(password_params)
    if @itenerary.edit_password == @itenerary.confirmation_password
      @itenerary.update(itenerary_params)
      redirect_to itenerary_path(@itenerary)
    else
      redirect_to edit_itenerary_path(@itenerary)
    end

    tag_list = params[:itenerary][:tag_name].split(",")
    if @itenerary.update(itenerary_params)
      @itenerary.save_iteneraries(tag_list)
    end
  end

  private

  def itenerary_params
    params.require(:itenerary).permit(:title, :edit_password, :confirmation_password, belongings_attributes: [:id, :belongings_name, :_destroy], schedules_attributes: [:id, :schedules_date, :schedules_time, :schedules_title, :schedules_comment, :_destroy], albums_attributes: [:id, :image, :albums_comment, :albums_map, :_destroy])
  end

  def password_params
    params.require(:itenerary).permit(:confirmation_password)
  end
end