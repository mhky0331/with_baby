class Admin::FacilitiesController < ApplicationController

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @facilities = Facility.all.page(params[:page]).per(10)
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
      if @facility.update(facility_params)
         redirect_to admin_facilities_path(@facility.id)
      else
         @facilities = Facility.all
         render :edit
      end
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
  end


  private

  def facility_params
    params.require(:facility).permit(:user_id, :name, :content, :latitude, :longitude, facility_photos:[])
  end

end
