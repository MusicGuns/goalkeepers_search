class SectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update destroy]
  before_action :redirect_to_authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  def show
    authorize @section
    @ice_palace = IcePalace.find(params[:ice_palace_id])
  end

  def new
    @ice_palace = IcePalace.find(params[:ice_palace_id] )
    @section = Section.new
    authorize @section
  end

  def edit
    authorize @section
    @ice_palace = IcePalace.find(params[:ice_palace_id] )
  end

  def create
    @section = Section.new(section_params)
    @ice_palace = IcePalace.find(params[:ice_palace_id])
    @section.user = current_user
    @section.ice_palace = @ice_palace

    authorize @section

    if @section.save
      redirect_to ice_palace_section_url(id: @section.id), notice: "Section was successfully created."
    else
      render :new
    end
  end

  def update
    @ice_palace = IcePalace.find(params[:ice_palace_id])
    authorize @section

    if @section.update(section_params)
      redirect_to ice_palace_section_url(id: @section.id), notice: "Section was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @ice_palace = IcePalace.find(params[:ice_palace_id])
    authorize @section

    @section.destroy
    redirect_to ice_palace_url(@ice_palace), notice: "Section was successfully destroyed."
  end

  private

    def set_section
      @section = Section.find(params[:id])
    end

    def section_params
      params
      .require(:section)
      .permit(:weekday, :start_time, :end_time, :section_type, :level, :goalkeeper_level, :description, :cost)
    end

    def authorization_failed
      flash[:alert] = 'Авторизация не удалась'
      redirect_back(fallback_location: new_session_path)
    end
end
