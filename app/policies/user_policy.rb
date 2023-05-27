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

  def update_to_admin?
    @user&.is_admin
  end

  def schedule?
    @record.is_goalkeeper
  end
end
