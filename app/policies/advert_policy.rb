class AdvertPolicy < ApplicationPolicy
  def new?
    @user.present? && !@user.is_goalkeeper?
  end

  def create?
    @user.present? && !@user.is_goalkeeper?
  end

  def update?
    @record.present? && @record.author == @user
  end

  def destroy?
    update?
  end
end
