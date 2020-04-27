class OrderPolicy < ApplicationPolicy

  def create?
    record.user == user || admin
  end

  def show?
    record.user == user || admin
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
