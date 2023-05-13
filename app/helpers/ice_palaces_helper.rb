module IcePalacesHelper
  def user_subscriber?(entity)
    current_user.present? && entity.subscribers.where(id: current_user.id).exists?
  end
end
