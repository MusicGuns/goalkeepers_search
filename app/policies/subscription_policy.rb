class SubscriptionPolicy < ApplicationPolicy
  def create?
    @goalkeeper.present?
  end

  def destroy?
    @record.present? && @record.goalkeeper = @goalkeeper
  end
end
