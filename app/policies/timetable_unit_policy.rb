class TimetableUnitPolicy < ApplicationPolicy
  def edit?
    @record.present? && @record.user == @user
  end

  def update? = edit?
  def destroy? = edit?
end
