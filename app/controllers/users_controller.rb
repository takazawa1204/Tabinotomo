class UsersController < ApplicationController
  def show
    @user = current_user
    favorites = Favorite.where(user_id: current_user.id).pluck(:itenerary_id)  # ログイン中のユーザーのお気に入りのitenerary_idカラムを取得
    favorite_list = Itenerary.find(favorites)
    @favorite_list = Kaminari.paginate_array(favorite_list).page(params[:page]).per(3)
    @albums = Album.order("RANDOM()").limit(3)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end