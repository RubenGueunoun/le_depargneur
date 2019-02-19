class CompteBancairePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show_cb?
    true
  end
end
