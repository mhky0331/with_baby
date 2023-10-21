class User::FacilitiesController < ApplicationController

before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @facilities = Facility.all.page(params[:page]).per(10)
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    @facility.user_id =current_user.id
      if @facility.save
         redirect_to user_facilities_path(@facility.id)
      else
         @facility = Facility.all
         render :new
      end
  end

  def edit
  end

  def update
      if @facility.update(facility_params)
         redirect_to user_facility_path(@facility.id)
      else
         render :edit
      end
  end

  def destroy
    @facility.destroy
    redirect_to user_facilities_path
  end


  private

  def facility_params
    params.require(:facility).permit(:user_id, :name, :content, :latitude, :longitude, :facility_photos)
  end

  def ensure_user
    @facilities = current_user.facilities
    @facility = @facilities.find_by(id: params[:id])
    redirect_to user_facilities_path(@facility.id) unless @facility
  end

end
