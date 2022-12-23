class GoalkeepersController < ApplicationController
  before_action :set_goalkeeper, only: %i[show edit update destroy]
  before_action :goalkeeper_params, only: %i[update]

  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  # GET /goalkeepers/1 or /goalkeepers/1.json
  def show; end

  # GET /goalkeepers/1/edit
  def edit
    authorize @goalkeeper
  end

  # PATCH/PUT /goalkeepers/1 or /goalkeepers/1.json
  def update
    authorize @goalkeeper

    if @goalkeeper.update(goalkeeper_params)
      redirect_to goalkeeper_url(@goalkeeper), notice: 'Изменение успешно добавлены'
    else
      render :edit
    end
  end

  # DELETE /goalkeepers/1 or /goalkeepers/1.json
  def destroy
    authorize @goalkeeper

    @goalkeeper.destroy

    redirect_to root_path, notice: 'Вратарь успешно удален'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_goalkeeper
    @goalkeeper = Goalkeeper.find(params[:id])
  end

  def goalkeeper_params
    params.require(:goalkeeper).permit(:email, :full_name, :phone_number, :date_of_birth, :clubs, :metro, :avatar, :cost, :level)
  end

  def authorization_failed
    flash[:alert] = 'Авторизация не удалась'
    redirect_back(fallback_location: goalkeeper_path)
  end
end
