class CagnottePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    true
  end

  def create?
    true
  end

  def show_cagnotte?
    true
  end
end
