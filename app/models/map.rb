class Map < ApplicationRecord

  def show
    @map = Map.find(params[:id])
  end

end
