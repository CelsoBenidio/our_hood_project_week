class ProductPolicy < ApplicationPolicy

  def create?
    user.admin
  end

  def new?
    user.admin
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
