class SubscriptionsController < ApplicationController
  before_action :set_ice_palace, only: %i[create destroy]

  before_action :redirect_to_authenticate_user!, only: %i[create destroy]

  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  def create
    @new_subscription = @ice_palace.subscriptions.build(user: current_user)

    authorize @new_subscription

    if @new_subscription.save
      flash[:notice] = 'Подписка оформлена'
    else
      flash[:alert] = 'Вы уже подписаны'
    end
    redirect_to ice_palace_path(@ice_palace)
  end

  def destroy
    @subscription = @ice_palace.subscriptions.find_by(user: current_user)

    authorize @subscription, policy_class: SubscriptionPolicy

    if @subscription.destroy
      flash[:notice] = 'Подписка удалена'
    else
      flash[:alert] = 'Ошибка отписки'
    end
    render ice_palace_path(@ice_palace)
  end

  private

  def set_ice_palace
    @ice_palace = IcePalace.find(params[:ice_palace_id])
  end

  def authorization_failed
    flash[:alert] = 'Авторизация не удалась'
    redirect_back(fallback_location: new_session_path)
  end
end
