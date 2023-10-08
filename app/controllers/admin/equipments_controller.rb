class Admin::EquipmentsController < ApplicationController
  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @equipments = Equipment.all.page(params[:page]).per(10)
  end

  def facility
    @equipment = Equipment.new
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

   def update
    @equipment = Equipment.find(params[:id])
      if @equipment.update(equipment_params)
         redirect_to admin_equipments_path(@equipment.id)
      else
         @equipments = Equipment.all
         render :edit
      end
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
  end

  private

  def facility_params
    params.require(:equipment).permit(:name)
  end

end
