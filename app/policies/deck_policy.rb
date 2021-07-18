class DeckPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    record.user == user || user.admin == true
  end

  def destroy?
    record.user == user || user.admin == true
  end
end
