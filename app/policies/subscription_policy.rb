class SubscriptionPolicy < ApplicationPolicy
  def create?
    @user.present? && @user.is_goalkeeper?
  end

  def destroy?
    @record.present? && @record.user == @user
  end

  def approve?
    @record.present? && @record.entity.author == @user
  end

  def unapprove? = approve?
end
