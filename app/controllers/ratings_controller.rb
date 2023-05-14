class RatingsController < ApplicationController

  def create
    @rating = Rating.new(**ratings_params, author_id: current_user.id)

    authorize @rating

    if @rating.save
      redirect_to user_path(@rating.user), notice: "Оценка успешно сохранена"
    else
      redirect_to user_path(@rating.user), alert: "Что то пошло не так"
    end
  end

  def ratings_params
    params.permit(:mark, :user_id)
  end

end