class IcePalacesController < ApplicationController
  before_action :set_ice_palace, only: %i[show edit update destroy]

  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  # GET /ice_palaces or /ice_palaces.json
  def index
    @ice_palaces = IcePalace.all.to_a
    @ice_palace = IcePalace.new
    @users = User.where(is_goalkeeper: true)
  end

  def new
    @ice_palace = IcePalace.new
    authorize @ice_palace
  end

  def edit
    authorize @ice_palace
  end

  def update
    authorize @ice_palace

    if @ice_palace.update(ice_palace_params)
      redirect_to ice_palace_path(@ice_palace), notice: "Дворец успешно изменен"
    else
      render :edit
    end
  end

  def create
    @ice_palace = IcePalace.new(ice_palace_params)
    authorize @ice_palace

    if @ice_palace.save
      redirect_to ice_palace_path(@ice_palace), notice: "Дворец успешно создан"
    else
      render :new
    end
  end

  def destroy
    authorize @ice_palace

    if @ice_palace.destroy
      redirect_to :root, notice: "Дворец успешно удален"
    else
      render :edit
    end
  end

  # GET /ice_palaces/1 or /ice_palaces/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ice_palace
    @ice_palace = IcePalace.find(params[:id])
  end

  def ice_palace_params
    params.require(:ice_palace).permit(:description, :title, :adress, :cords, :photo)
  end
  
  def authorization_failed
    flash[:alert] = 'Авторизация не удалась'
    redirect_back(fallback_location: new_session_path)
  end
end
