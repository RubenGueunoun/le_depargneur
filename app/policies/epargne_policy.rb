class EpargnePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  def ma_depargne?
    true
  end

  def ssr_pluie?
    true
  end

  def ssr_cigarette?
    true
  end

  def ssr_virement?
    true
  end
end
