class ProductPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a product
  end

  def create?
    true  # Anyone can create a product
  end

  def update?
    record.user == user  # Only product creator can update it
  end

  def destroy?
    record.user == user  # Only product creator can update it
  end
end
