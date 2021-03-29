class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:request).where('requests.destinataire_id = ?', user.id)
        .or(scope.joins(:request).where('requests.emetteur_id = ?', user.id))
    end
  end
  def new?
    true
  end

  def create?
    user == record.request.emetteur
  end

  def destroy?
    record.request.emetteur == user
  end
end
