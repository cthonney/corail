class SlotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.property.owner == user
  end

  def destroy?
    record.property.owner == user
  end
end
