class ReviewPolicy < ApplicationPolicy
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
end
