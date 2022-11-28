class GoalkeeperPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    @goalkeeper == @record
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
