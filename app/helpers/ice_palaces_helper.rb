module IcePalacesHelper
  def user_subscriber?
    current_user.present? && @section.subscribers.where(id: current_user.id).exists?
  end
end
