module IcePalacesHelper
  def user_subscriber?
    current_user.present? && @ice_palace.subscribers.where(id: current_user.id).exists?
  end
end
