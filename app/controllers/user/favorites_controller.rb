class User::FavoritesController < ApplicationController

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @favorites = Favorite.all.page(params[:page]).per(10)
  end

  def create
    @facility = Facility.find(params[:post_id])
    favorite = @facility.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @facility = Facility.find(params[:post_id])
    favorite = current_user.favorites.find_by(facility_id: facility.id)
    favorite.destroy
  end

end
