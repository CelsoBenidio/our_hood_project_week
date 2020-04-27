class OrderPolicy < ApplicationPolicy

  def create?
    record.user == user || admin
  end

  def show?
    record.user == user || admin
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
