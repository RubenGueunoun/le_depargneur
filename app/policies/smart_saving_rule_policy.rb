class SmartSavingRulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def associer_ssr?
    true
  end
end
