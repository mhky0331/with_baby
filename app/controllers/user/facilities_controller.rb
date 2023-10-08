class User::FacilitiesController < ApplicationController
  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @facilities = Facility.all.page(params[:page]).per(10)
  end

  def show
    @facility = facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
      if @facility.save
         redirect_to user_facilities_path(@facility.id)
      else
         @facilities = Facility.all
         render :new
      end
  end

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
      if @facility.update(facility_params)
         redirect_to user_facilities_path(@facility.id)
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
    params.require(:facility).permit(:user_id, :name, :content, :latitude, :longitude, :facility_image)
  end

end
