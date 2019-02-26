class SmartSavingRulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def associer_ssr?
    true
  end

  def ma_depargne?
    true
  end
end
