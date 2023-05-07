class SubscriptionsController < ApplicationController
  before_action :set_section, only: %i[create destroy]

  before_action :redirect_to_authenticate_user!, only: %i[create destroy]

  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  def create
    @new_subscription = @section.subscriptions.build(user: current_user)

    authorize @new_subscription

    if @new_subscription.save
      flash[:notice] = 'Подписка оформлена'
    else
      flash[:alert] = 'Вы уже подписаны'
    end
    redirect_to ice_palace_section_path(ice_palace_id: params[:ice_palace_id], id: @section.id)
  end

  def destroy
    @subscription = @section.subscriptions.find_by(user: current_user)

    authorize @subscription, policy_class: SubscriptionPolicy

    if @subscription.destroy
      flash[:notice] = 'Подписка удалена'
    else
      flash[:alert] = 'Ошибка отписки'
    end
    redirect_to ice_palace_section_path(@section)
  end

  private

  def set_section
    @section = Section.find(params[:section_id])
  end

  def authorization_failed
    flash[:alert] = 'Авторизация не удалась'
    redirect_back(fallback_location: new_session_path)
  end
end
