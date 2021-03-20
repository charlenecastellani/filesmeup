class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(emetteur: user).or(scope.where(destinataire: user))
    end
  end

  def create?
    true
  end

  def show?
    record.emetteur == user || record.destinataire == user
  end

  def update?
    record.emetteur == user
  end

  def destroy?
    record.emetteur == user
  end
end
