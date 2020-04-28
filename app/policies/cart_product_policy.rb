class CartProductPolicy < ApplicationPolicy
   def create?
    record.cart.user == user || user.admin
  end

  def destroy?
    record.cart.user == user || user.admin
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
