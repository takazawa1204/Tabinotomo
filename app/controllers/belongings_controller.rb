class BelongingsController < ApplicationController
  def create
    @itenerary = Itenerary.find(params[:itenerary_id])
    @belonging = @itenerary.belongings.new(beloging_params)
    @belonging.itenerary_id = itenerary.id
    @belonging.save
    redirect_to new_itenerary_path
  end

  def destroy
  end

  private

  def belonging_params
    params.require(:belonging).permit(:belongings_name, :itenerary_id)
  end
end
