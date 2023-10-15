class Admin::EquipmentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @equipment = Equipment.new
    @equipments = Equipment.page(params[:page])
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
       redirect_to admin_equipments_path(@equipment.id), notice: "新しい設備を追加しました。"
    else
       @equipments = Equipment.page(params[:page])
       flash.now[:alert] = "設備の追加に失敗しました。"
       render :index
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end



  def update
    @equipment = Equipment.find(params[:id])
    if @equipment.update(equipment_params)
       redirect_to admin_equipments_path(@equipment.id), notice: "設備の更新に成功しました。"
    else
       flash.now[:alert] = "設備の更新に失敗しました。"
       render :edit
    end
  end

  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
    redirect_to admin_equipments_path, notice: "設備を削除しました。"

  end

  private

  def equipment_params
    params.require(:equipment).permit(:name)
  end

end
