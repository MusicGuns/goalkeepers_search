class SubscriptionsController < ApplicationController
  before_action :set_entity, only: %i[create destroy]

  before_action :redirect_to_authenticate_user!, only: %i[create destroy]

  rescue_from Pundit::NotAuthorizedError, with: :authorization_failed

  def create
    @new_subscription = @entity.subscriptions.build(user: current_user)

    authorize @new_subscription

    if @new_subscription.save
      flash[:notice] = 'Подписка оформлена'
    else
      flash[:alert] = 'Вы уже подписаны'
    end

    case entity_type
    when :section
      redirect_to ice_palace_section_path(ice_palace_id: @entity.ice_palace_id, id: @entity.id)
    when :advert
      redirect_to adverts_path
    end
  end

  def destroy
    @subscription = @entity.subscriptions.find_by(user: current_user)

    authorize @subscription, policy_class: SubscriptionPolicy

    if @subscription.destroy
      flash[:notice] = 'Подписка удалена'
    else
      flash[:alert] = 'Ошибка отписки'
    end

    case entity_type
    when :section
      redirect_to ice_palace_section_path(@entity)
    when :advert
      redirect_to adverts_path
    end
  end

  def approve
    @subscription = Subscription.find(params[:id])

    @entity = @subscription.entity

    authorize @subscription, policy_class: SubscriptionPolicy

    if @subscription.update(approved: true)
      flash[:notice] = 'Подписка одобрена'
    else
      flash[:alert] = 'Ошибка одобрения'
    end

    case @subscription.entity_type
    when 'Section'
      redirect_to ice_palace_section_path(ice_palace_id: @entity.ice_palace_id, id: @entity.id)
    when 'Advert'
      redirect_to edit_advert_path(@entity)
    end
  end

  def unapprove
    @subscription = Subscription.find(params[:id])

    @entity = @subscription.entity

    authorize @subscription, policy_class: SubscriptionPolicy

    if @subscription.update(approved: false)
      flash[:notice] = 'Подписка удалена'
    else
      flash[:alert] = 'Ошибка удаления'
    end

    case @subscription.entity_type
    when 'Section'
      redirect_to ice_palace_section_path(ice_palace_id: @entity.ice_palace_id, id: @entity.id)
    when 'Advert'
      redirect_to edit_advert_path(@entity)
    end
  end

  private

  def set_entity
    @entity = entity_type.to_s.camelize.constantize.find(params[:"#{entity_type}_id"])
  end

  def authorization_failed
    flash[:alert] = 'Авторизация не удалась'
    redirect_back(fallback_location: new_session_path)
  end

  def entity_type
    params[:section_id] ? :section : :advert
  end
end
