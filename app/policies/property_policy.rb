class PropertyPolicy < ApplicationPolicy
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
      record.user == current_user
    end

    def destroy?
      record.user == current_user
    end
end
