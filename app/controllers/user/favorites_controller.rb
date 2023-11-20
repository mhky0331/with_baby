class User::FavoritesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_facility, only:[:create,:destroy]

  def index
    favorites = Favorite.where(user_id: params[:user_id]).pluck(:facility_id)
    @favorite = Facility.where(id: favorites).order("created_at DESC")
  end

  def create
    @favorite = Favorite.create(user_id: current_user.id, facility_id: @facility.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, facility_id: @facility.id)
    @favorite.destroy
  end
  private
  def set_facility
    @facility = Facility.find(params[:facility_id])
  end
end
