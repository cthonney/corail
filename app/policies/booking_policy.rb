class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.slot.property.owner != user
  end

  def show?
    true
  end

  def update?
    false
  end

  def destroy?
    record.buyer == user
  end
end
