class CartPolicy < ApplicationPolicy

  def show?
    record.user == user || user.admin
  end

  def update?
    record.user == user || user.admin
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
