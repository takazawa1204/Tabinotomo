class ItenerariesController < ApplicationController
  def new
    @itenerary = Itenerary.new
    @belonging = @itenerary.belongings.build
    @schedule = @itenerary.schedules.build
    @album = @itenerary.albums.build
  end

  def create
    @itenerary ||= Itenerary.new(itenerary_params)
    if @itenerary.save
      # belogings
      params[:itenerary][:belongings_attributes].values.each do |v|
        @itenerary.belongings.create({ belongings_name: v[:belongings_name] })
      end

      # Schedule
      params[:itenerary][:schedules_attributes].values.each do |v|
        @itenerary.schedules.create({
          schedules_date: v[:schedules_time],
          schedules_time: v[:schedules_time],
          schedules_title: v[:schedules_title],
          schedules_comment: v[:schedules_comment],
        })
      end

      redirect_to itenerary_path(@itenerary)
      # tag_list = params[:itenerary][:tag_name].split(",")
      # if @itenerary.save
      #   @itenerary.save_iteneraries(tag_list)
      # end
    else
      render "new"
    end
  end

  def index
    tag_list = Tag.all
    @tag_list = @iteneraries = Kaminari.paginate_array(tag_list).page(params[:page]).per(5)
    iteneraries = params[:tag_id].present? ? Tag.find(params[:tag_id]).iteneraries : Itenerary.all
    @iteneraries = Kaminari.paginate_array(iteneraries).page(params[:page]).per(5)
    @albums = Album.all
  end

  def show
    @itenerary = Itenerary.find(params[:id])
    @belongings = Belonging.where(itenerary_id: params[:id])

    @schedules = Schedule.where(itenerary_id: params[:id]).
      order(:schedules_date).order(:schedules_time).
      group_by { |schedule| schedule.schedules_date }
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
    if @itenerary.edit_password == params[:itenerary][:confirmation_password]
      @itenerary.update(itenerary_params)
      # belogings
      params[:itenerary][:belongings_attributes].values.each do |v|
        if v.include?(:id) # ??????(id??????)
          Belonging.find(v[:id]).update({ belongings_name: v[:belongings_name] })
        else
          # ????????????(id??????)
          @itenerary.belongings.create({ belongings_name: v[:belongings_name] })
        end
      end

      # Schedule
      params[:itenerary][:schedules_attributes].values.each do |v|
        if v.include?(:id) # ??????(id??????)
          Schedule.find(v[:id]).update({
            schedules_date: v[:schedules_time],
            schedules_time: v[:schedules_time],
            schedules_title: v[:schedules_title],
            schedules_comment: v[:schedules_comment],
          })
        else
          # ????????????(id??????)
          @itenerary.schedules.create({
            schedules_date: v[:schedules_time],
            schedules_time: v[:schedules_time],
            schedules_title: v[:schedules_title],
            schedules_comment: v[:schedules_comment],
          })
        end
      end

      # Album
      unless params[:itenerary][:albums_attributes].nil?
        params[:itenerary][:albums_attributes].values.each do |v|
          if v.include?(:id) # ??????(id??????)
            Album.find(v[:id]).update({ image: v[:image], albums_comment: v[:albums_comment] })
            album = Album.find(v[:id]) # ????????????album?????????
          else # ????????????(id??????)
            album = @itenerary.albums.create({
              image: v[:image],
              albums_comment: v[:albums_comment],
            }) # ??????????????????album?????????
          end
          # -------------------------------------------
          tags = Vision.get_image_data(album.image) # album?????????????????????API???
          @itenerary.save_iteneraries(tags) # API???????????????tag?????????
          # -------------------------------------------
        end
      end

      redirect_to itenerary_path(@itenerary)

    else
      redirect_to edit_itenerary_path(@itenerary)
    end
  end

  private

  def itenerary_params
    params.require(:itenerary).permit(:title, :edit_password, :tag_name, :confirmation_password)
  end
end
