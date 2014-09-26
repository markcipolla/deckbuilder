class DataPacksController < ApplicationController
  def index
    @data_packs = DataPack.all.sort_by &:created_at
  end

  def show
    @data_pack = DataPack.friendly.find(params[:id])
  end
end
