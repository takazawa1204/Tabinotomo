class SchedulesController < ApplicationController
  def create
    @itenerary = Itenerary.find(params[:itenerary_id])
    @schedule = @itenerary.schedules.new(schedule_params)
    @schedule.itenerary_id = itenerary.id
    @schedule.save
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

  def schedule_params
    params.require(:schedule).permit(:schedules_date, :schedules_time, :schedules_title,
                                     :schedules_comment, :itenerary_id)
  end
end
