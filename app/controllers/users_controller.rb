class UsersController < ApplicationController
  def show
    @user = current_user
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