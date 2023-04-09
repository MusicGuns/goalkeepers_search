class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    @user == @record
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def update_to_admin?
    @user&.is_admin
  end
end
