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
end