class Admin::EquipmentsController < ApplicationController

  def index
    @equipments = Equipment.all
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
       redirect_to admin_equipments_path(@equipment.id)
    else
       @equipments = Equipment.all
       render :index
    end
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
    redirect_to admin_equipments_path

  end

  private

  def equipment_params
    params.require(:equipment).permit(:name)
  end

end
