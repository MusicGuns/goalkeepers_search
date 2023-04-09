class SubscriptionPolicy < ApplicationPolicy
  def create?
    @user.present?
  end

  def destroy?
    @record.present? && @record.user = @user
  end
end
