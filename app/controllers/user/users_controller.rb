class User::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
      if @user.update(mypage_params)
         flash[:notice] = "会員情報を更新出来ました。"
         redirect_to user_user_path
      else
         render :edit
      end
  end

  private

  def mypage_params
    params.require(:user).permit(:name, :email, :profile_image)
  end

end
