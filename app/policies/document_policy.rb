class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:request).where('requests.destinataire_id = ?', user.id)
        .or(scope.joins(:request).where('requests.emetteur_id = ?', user.id))
    end
  end
end
