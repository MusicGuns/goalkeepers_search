module IcePalacesHelper
  def goalkeeper_subscriber?
    current_goalkeeper.present? && @ice_palace.subscribers.where(id: current_goalkeeper.id).exists?
  end
end
