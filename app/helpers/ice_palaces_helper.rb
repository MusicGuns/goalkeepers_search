module IcePalacesHelper
  def goalkeeper_subscriber?
    current_goalkeeper.present? && @ice_palace.subscribers.find(current_goalkeeper)
  end
end
