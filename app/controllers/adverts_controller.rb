class AdvertsController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  def index
    @adverts = Advert.all
    @users = User.where(is_goalkeeper: true)
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update
    @advert = Advert.find(params[:id])

    authorize @advert

    @advert.update(advert_params) ? redirect_to(adverts_path) : render(:edit)
  end

  def destroy
    @advert = Advert.find(params[:id])

    authorize @advert

    @advert.destroy ? redirect_to(adverts_path) : render(:index)
  end

  def create
    @advert = Advert.new(advert_params)

    authorize @advert

    @advert.author = current_user
    @advert.save ? redirect_to(adverts_path) : render(:new)
  end

  def new
    @advert = Advert.new
    authorize @advert
  end

  private

  def advert_params
    params.require(:advert).permit(:title, :description)
  end
end
