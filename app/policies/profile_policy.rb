class ProfilePolicy < ApplicationPolicy
  def create?
    true
  end

  def new?
    true
  end

  def show?
    true
  end
end
