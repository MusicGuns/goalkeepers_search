class TimetableUnitsController < ApplicationController
  before_action :redirect_to_authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  def new
    @unit = TimetableUnit.new
  end

  def edit
    authorize unit
  end

  def create
    @unit = TimetableUnit.new(unit_params)

    @unit.user = current_user

    if @unit.save
      flash[:notice] = 'Событие создано'
      redirect_to schedule_user_path(current_user)
    else
      render :new
    end
  end

  def update
    authorize unit

    if unit.update(unit_params)
      flash[:notice] = 'Событие обновлено'
      redirect_to schedule_user_path(current_user)
    else
      flash.now[:alert] = 'Проверьте поля формы'
      render :edit
    end
  end

  def destroy
    authorize unit

    if unit.destroy
      flash[:notice] = 'Событие удалено'
    else
      flash[:alert] = 'Произошла ошибка'
    end

    redirect_to schedule_user_path(current_user)
  end

  private

  def unit_params
    params
      .require(:timetable_unit)
      .permit(:title, :start_time, :end_time, :weekday)
  end

  def unit
    @unit ||= TimetableUnit
      .where(user: current_user, id: params[:id])
      .first
  end
end
