class CartProductsPolicy < ApplicationPolicy
  def create?
    record.user == user || user.admin
  end

  def destroy?
    user.admin
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
