class IcePalacesController < ApplicationController
  before_action :set_ice_palace, only: %i[show]

  # GET /ice_palaces or /ice_palaces.json
  def index
    @ice_palaces = IcePalace.all
    @goalkeepers = Goalkeeper.all
  end

  # GET /ice_palaces/1 or /ice_palaces/1.json
  def show
    @new_subscription = @ice_palace.subscriptions.build(params[:subscription])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ice_palace
    @ice_palace = IcePalace.find(params[:id])
  end
end
