class SectionPolicy < ApplicationPolicy
  def show?
    true
  end

  def new?
    !@user&.is_goalkeeper
  end

  def create?
    update?
  end

  def destroy?
    update?
  end

  def update?
    !@user&.is_goalkeeper && @record.user = @user
  end

  def edit?
    update?
  end
end