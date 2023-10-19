class Admin::UsersController < ApplicationController

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
      if @users.update(user_params)
         redirect_to admin_user_path(@users.id)
      else
         @user = User.all
         render :show
      end
  end

 private

 def user_params
  params.require(:user).permit(:name, :email, :profile_image, :active)
 end

end