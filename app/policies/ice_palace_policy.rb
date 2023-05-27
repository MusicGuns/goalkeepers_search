class IcePalacePolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    @user&.is_admin
  end

  def edit
    update?
  end

  def new?
    @user&.is_admin
  end

  def destroy?
    @user&.is_admin
  end

  def create?
    @user&.is_admin
  end
end