class GoalkeepersController < ApplicationController
  before_action :set_goalkeeper, only: %i[show edit update destroy]

  # GET /goalkeepers or /goalkeepers.json
  def index
    @goalkeepers = Goalkeeper.all
  end

  # GET /goalkeepers/1 or /goalkeepers/1.json
  def show; end

  # GET /goalkeepers/new
  def new
    @goalkeeper = Goalkeeper.new
  end

  # GET /goalkeepers/1/edit
  def edit; end

  # POST /goalkeepers or /goalkeepers.json
  def create
    @goalkeeper = Goalkeeper.new(goalkeeper_params)

    respond_to do |format|
      if @goalkeeper.save
        format.html { redirect_to goalkeeper_url(@goalkeeper), notice: 'Goalkeeper was successfully created.' }
        format.json { render :show, status: :created, location: @goalkeeper }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goalkeeper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goalkeepers/1 or /goalkeepers/1.json
  def update
    respond_to do |format|
      if @goalkeeper.update(goalkeeper_params)
        format.html { redirect_to goalkeeper_url(@goalkeeper), notice: 'Goalkeeper was successfully updated.' }
        format.json { render :show, status: :ok, location: @goalkeeper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goalkeeper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goalkeepers/1 or /goalkeepers/1.json
  def destroy
    @goalkeeper.destroy

    respond_to do |format|
      format.html { redirect_to goalkeepers_url, notice: 'Goalkeeper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_goalkeeper
    @goalkeeper = Goalkeeper.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def goalkeeper_params
    params.require(:goalkeeper).permit(:full_name, :phone_number, :date_of_birth, :mail, :clubs, :metro, :avatar)
  end
end
