class SubscriptionPolicy < ApplicationPolicy
  def create?
    @user.present? && @user.is_goalkeeper?
  end

  def destroy?
    @record.present? && @record.user = @user
  end
end
